class ActivitiesController < ApplicationController
  def random
    @criteria = Criteria.new
    @suggestions = Activity.random(10)
    @all_weathers = Weather.all
    render :suggestions
  end

  def filtered
    @criteria = Criteria.new(params[:criteria]) 
    @suggestions = Weather.find(@criteria.weather_id).activities
    @all_weathers = Weather.all
    render :suggestions
  end
end
