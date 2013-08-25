class ActivitiesController < ApplicationController
  def suggestions
    criteria_in_session = session[:criteria]
    @all_weathers = Weather.all
    if criteria_in_session.nil?
      @criteria = Criteria.new
      @suggestions = Activity.random(10)
    else
      @criteria = criteria_in_session 
      @suggestions = Weather.find(@criteria.weather_id).activities
    end
  end

  def create
    activity = Activity.create(activity_params)
    redirect_to suggestions_activities_path, :notice => "'#{activity_params[:name]}' created"
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :weather_id)
  end

end
