class ActivitiesController < ApplicationController
  def random
    @suggestions = Activity.random(10)
  end
end
