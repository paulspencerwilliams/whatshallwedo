namespace :app do
  desc <<-DESC
        Load dev data.
            Run using the command 'rake app:load_dev_data'
  DESC
  task :load_dev_data => [:environment] do
    Activity.delete_all

    sunny = Weather.find_by_name('Sunny')
    activity = Activity.create!(:name=>'Jet Skiing', :weather=>sunny)
  end
end

