class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :key
      t.text :body
      t.string :video
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
