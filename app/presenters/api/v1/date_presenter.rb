class Api::V1::DatePresenter

  attr_reader :events, :date, :current_user

  def initialize(events, date, current_user)
    @events, @date, @current_user = events, date, current_user
  end

  def as_json
    date = Date.parse(@date)
    json = @events.not_repeat.where(date: @date).as_json(methods: :truncated)
    json += @events.weekly.dow(date).as_json(methods: :truncated)
    json += @events.monthly.dom(date).as_json(methods: :truncated)
    json += @events.yearly.doy(date).as_json(methods: :truncated)

    json.each do |e|
      e['date'] = @date
      e['edit'] = (e['user_id'] == @current_user.id)
    end

  end

end
