class EventsController < InheritedResources::Base
  before_action :authenticate_user!

  def create
    @event = current_user.events.build(permitted_params[:event])
    create! do |success, failure|
      failure.html do
        flash[:error] = resource.errors.full_messages
        redirect_to new_event_url
      end
      success.html { redirect_to events_path }
    end
  end

  def edit
    super do |format|
      unless Event.find(params[:id]).user == current_user
        format.html { redirect_to event_path(params[:id]) }
      end
    end
  end

  def update
    update! do |success, failure|
      failure.html do
        flash[:error] = resource.errors.full_messages
        redirect_to edit_event_url(@event)
      end
      success.html { redirect_to events_path }
    end
  end

private

  def permitted_params
    params.permit(event: [:name, :date, :repeat, :description])
  end

end
