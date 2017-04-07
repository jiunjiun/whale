class CreateSharkPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :shark_photos do |t|
      t.string  :image
      t.integer :position

      t.references :shark, index: true, foreign_key: true

      t.timestamps
    end
  end
end
