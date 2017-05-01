class CreateUserDonates < ActiveRecord::Migration[5.0]
  def change
    create_table :user_donates do |t|
      t.references :user, index: true, foreign_key: true
      t.integer    :kind, default: 1
      t.text       :html

      t.timestamps
    end

    User.all.each do |user|
      user.create_donate
    end
  end
end
