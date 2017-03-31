class CreateBots < ActiveRecord::Migration[5.0]
  def change
    create_table :bots do |t|
      t.references :shark, foreign_key: true
      t.integer    :kind
      t.string     :bot_id
      t.text       :url

      t.timestamps
    end
  end
end
