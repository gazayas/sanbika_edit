class User < ActiveRecord::Base

  attr_accessor :remember_token, :activation_token
  before_create :create_activation_digest
  #before_save :downcase_email

  has_secure_password
  has_many :songs, :dependent => :destroy
  # アカウントが削除されると歌が削除されないように（？）
  # optionができるようにすること
  accepts_nested_attributes_for :songs, :allow_destroy => true # これは要る？適当に入れた

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  private

=begin
  def downcase_email
    self.email = email.downcase
  end
=end

  def remember # このメソッドが要るかどうか分からない...
    self.remeber_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def create_activation_digest
    # ここにtokenとdigestを作る
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
