module ApplicationHelper

  def order_songs(songs)
    # User.order(title_yomikata: :desc) をしてしまうと、五十音順ではなくて桁数で整理されてしまうので、
    # Ruby の方で配列をsortする
    song_titles = []
    songs.each do |song|
      song_titles << song.title_yomikata
    end
    song_titles = song_titles.sort
    new_song_order = []
    song_titles.each do |title|
      songs.each do |song|
        if song.title_yomikata == title
          new_song_order << song
        end
      end
    end
    new_song_order
  end

end
