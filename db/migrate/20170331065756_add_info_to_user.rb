class AddInfoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :status, :integer, default: 1
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :phone, :string
    add_column :users, :address, :string
  end
end
