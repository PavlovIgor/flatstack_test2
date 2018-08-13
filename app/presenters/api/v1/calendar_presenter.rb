class Api::V1::CalendarPresenter
  attr_reader :events, :start, :stop

  def initialize(events, start, stop)
    @events = events
    @start = start
    @stop = stop
  end

  def as_json
    json = @events.not_repeat.between(@start, @stop).as_json
    json += prepare(:weekly, :wday)
    json += prepare(:monthly, :mday)
    json += prepare(:yearly, :yday)
  end

private

  def event_dates(event, group)
    dates = (event.date..Date.parse(@stop)).group_by { |d| d.public_send(group) }
    Array(dates[event.date.public_send(group)])
  end

  def prepare(scope, group)
    result = []

    @events.send(scope).find_each do |event|
      event_dates(event, group).each do |date|
        event.date = date
        result << event.as_json
      end
    end

    result
  end

end
