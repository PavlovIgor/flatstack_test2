class Api::V1::EventsController < ActionController::API

  before_action :authenticate_user!

  def callendar
    events = (params[:scope] == "all") ? Event.all : current_user.events
    render json: Api::V1::CalendarPresenter.new(events,
                                                params[:start],
                                                params[:end] ).as_json
  end

  def date
    events = (params[:scope] == "all") ? Event.all : current_user.events
    render json: Api::V1::DatePresenter.new(events, params[:date]).as_json
  end

end
