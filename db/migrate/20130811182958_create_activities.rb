class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.references :weather, index: true

      t.timestamps
    end
  end
end
