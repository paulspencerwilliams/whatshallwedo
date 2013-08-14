module ActivitiesHelper 
  def create_activity(name, weather)
    FactoryGirl.create(:activity, 
                      {:name => name, 
                       :weather => Weather.find_or_create_by(name: weather)})
  end
end

World(ActivitiesHelper)
