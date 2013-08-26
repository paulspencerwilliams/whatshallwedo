class Weather < ActiveRecord::Base
  has_many :undone_activities, -> { where done: false }, class_name: 'Activity'
  has_many :activities
end
