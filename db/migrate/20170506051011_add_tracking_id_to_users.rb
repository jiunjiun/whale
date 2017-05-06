class AddTrackingIdToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :tracking_id, :string
  end

  def down
    remove_column :users, :tracking_id
  end
end
