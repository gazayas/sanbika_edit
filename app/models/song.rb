class Song < ActiveRecord::Base

  belongs_to :user, :foreign_key => "user_id"

  validates :title, presence: true, length: {maximum: 30}
  validates :title_yomikata, length: {maximum: 40}
  validates :artist, length: {maximum: 30} # これを 20 にした方がいいかな
  validates :artist_yomikata, length: {maximum: 30}
  validates :body, presence: true, length: {maximum: 3000}

end
