class User < ActiveRecord::Base

  attr_accessor :remember_token, :activation_token, :reset_token
  before_create :create_activation_digest
  has_secure_password
  has_many :songs, :dependent => :destroy
  accepts_nested_attributes_for :songs, :allow_destroy => true # :allow_destroy の部分が要るかどうか分からん
  # before_save :downcase_email これは Michael Hartl のチュートリアルにあった

  # バリデーション
  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 30 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  validates :status, length: { maximum: 140 }

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

  # アカウントをアクティベートする
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver
  end

  # パスワード更新に関するメソッド
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # もし２時間が経ったらパスワードの更新ができません
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

=begin
  Michael Hartl のチュートリアルにあったコードなんですか、
  具体的になぜ使っていたか分からないからここで使っていません
  def downcase_email
    self.email = email.downcase
  end
=end

  def remember # これは要らんかな。別にメールを覚える必要はないかな
    self.remeber_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def create_activation_digest
    # ここにtokenとdigestを作る
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
