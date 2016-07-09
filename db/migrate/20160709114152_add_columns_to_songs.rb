class AddColumnsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :title_yomikata, :string
    add_column :songs, :artist, :string
    add_column :songs, :artist_yomikata, :string
  end
end
