class EventsController < InheritedResources::Base
  before_action :authenticate_user!

  def create
    current_user.events.create!(permitted_params[:event])
    redirect_to events_path
  end

  def edit
    super do |format|
      unless Event.find(params[:id]).user == current_user
        format.html { redirect_to event_path(params[:id]) }
      end
    end
  end

  def update
    super do |format|
      format.html { redirect_to events_path }
    end
  end

private

  def permitted_params
    params.permit(event: [:name, :date, :repeat, :description])
  end

end
