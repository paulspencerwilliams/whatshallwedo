class CriteriaController < ApplicationController 
  def update
    session[:criteria] = Criteria.new(criteria_params)
    redirect_to suggestions_activities_path
  end

  private
  def criteria_params
    params.require(:criteria).permit(:weather_id)
  end
end
