class ActivitiesController < ApplicationController
  def random
    @suggestions = Activity.random(10)
    @all_weathers = Weather.all
    render :suggestions
  end

  def filtered
    @suggestions = Weather.find(params[:criteria][:weather_id]).activities
    @all_weathers = Weather.all
    render :suggestions
  end
end
