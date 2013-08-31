class Activity < ActiveRecord::Base
  belongs_to :weather

  def self.random_undone(amount_to_return)
    Activity.where(:done => false).random(amount_to_return)
  end
end
