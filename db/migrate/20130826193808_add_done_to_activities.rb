class AddDoneToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :done, :boolean, default: false 
    Activity.update_all done: false
  end
end
