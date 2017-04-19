class AddInfoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :status,       :integer, default: 1
    add_column :users, :name,         :string
    add_column :users, :public_email, :string
    add_column :users, :location,     :string
    add_column :users, :website,      :text
    add_column :users, :bio,          :text, commit: 'biography'
    add_column :users, :avatar,       :string
    add_column :users, :github,       :string
  end
end
