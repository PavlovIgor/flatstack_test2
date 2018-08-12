class Api::V1::DatePresenter

  attr_reader :events, :date

  def initialize(events, date)
    @events, @date = events, date
  end

  def as_json
    date = Date.parse(@date)
    json = @events.not_repeat.where(date: @date).as_json(methods: :truncated)
    json += @events.weekly.dow(date.wday).as_json(methods: :truncated)
    json += @events.monthly.dom(date.mday).as_json(methods: :truncated)
    json += @events.yearly.doy(date.yday).as_json(methods: :truncated)
    json.each{ |e| e['date'] = @date }
  end

end
