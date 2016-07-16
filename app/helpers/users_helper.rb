module UsersHelper

  def order_songs(songs)

    # User.order(title_yomikata: :desc) をしてしまうと、五十音順ではなくて桁数で整理されてしまうので、
    # Ruby の方で配列をsortする

    array = []
    songs.each do |song|
      array << song.title_yomikata
    end
    array = array.sort
    # binding.pry を使うとserverを立ててから配列が上手く整理されたことを確認できる
    array
    
  end

end
