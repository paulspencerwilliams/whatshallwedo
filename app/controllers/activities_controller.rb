class ActivitiesController < ApplicationController
  def suggestions
    criteria_in_session = session[:criteria]
    @all_weathers = Weather.all
    if criteria_in_session.nil?
      @criteria = Criteria.new
      @suggestions = Activity.random_undone(10)
    else
      @criteria = criteria_in_session 
      @suggestions = Weather.find(@criteria.weather_id).undone_activities
    end
  end

  def create
    activity = Activity.create(create_activity_params)
    redirect_to suggestions_activities_path, :notice => "'#{create_activity_params[:name]}' created"
  end

  def update
    activity = Activity.find_by_id(params[:id])
    activity.update_attributes(done_activity_params)
    redirect_to suggestions_activities_path, :notice => "'#{activity.name}' marked as done"
  end

  private

  def create_activity_params
    params.require(:activity).permit(:name, :weather_id)
  end

  def done_activity_params
    params.require(:activity).permit(:done)
  end

end
