class Song < ActiveRecord::Base

  belongs_to :user, :foreign_key => "user_id"

  validates :title, presence: true, length: {maximum: 30}
  validates :title_yomikata, presence: true, length: {maximum: 40}
  validates :artist, length: {maximum: 30} # これを 20 にした方がいいかな
  validates :artist_yomikata, length: {maximum: 30}
  validates :body, presence: true, length: {maximum: 6000}

  def self.search(search)
    if search
      Song.where(['title LIKE ?', "%#{search}%"])
    else
      Song.all
    end
  end

end
