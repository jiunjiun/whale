class CreateSharks < ActiveRecord::Migration[5.0]
  def change
    create_table :sharks do |t|
      t.string   :name
      t.integer  :cetacea
      t.text     :desc
      t.integer  :status, default: 1
      t.text     :website
      t.text     :facebook_url, commit: 'Facebook fans'
      t.text     :github_url,   commit: 'GitHub Url'
      t.text     :youtube_url,  commit: 'Youtube Url'

      t.string   :logo
      t.string   :banner, commit: 'Facebook og:image'

      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
