class ActivitiesController < ApplicationController
  def random
    @criteria = Criteria.new
    @suggestions = Activity.random(10)
    @all_weathers = Weather.all
    render :suggestions
  end

  def filtered
    @activity = Activity.new
    @criteria = Criteria.new(params[:criteria]) 
    @suggestions = Weather.find(@criteria.weather_id).activities
    @all_weathers = Weather.all
    render :suggestions
  end

  def create
    Activity.create(new_activity_params)
    redirect_to :random_activities, :notice => "'#{new_activity_params[:name]}' created"
  end

  private
  def new_activity_params
    params.require(:activity).permit(:name, :weather_id)
  end
end
