module ActivitiesHelper 

  def create_weather(weather)
    FactoryGirl.create(:weather, {:name => weather })
  end

  def create_activity(name, weather)
    FactoryGirl.create(:activity, 
                      {:name => name, 
                       :weather => Weather.find_or_create_by(name: weather)})
  end
end

World(ActivitiesHelper)
