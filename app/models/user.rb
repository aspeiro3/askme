require 'openssl'

class User < ApplicationRecord
  INTERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new
  EMAIL_FORMAT = /\A.+@.+\z/
  USERNAME_FORMAT = /\A\w+\z/
  BACKGROUND_FORMAT = /\A#([0-9a-f]{3}|[0-9a-f]{6})\z/

  attr_accessor :password

  scope :sorted, -> {order(created_at: :asc)}

  has_many :questions, dependent: :destroy

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: EMAIL_FORMAT }

  validates :background,
            presence: true,
            format: { with: BACKGROUND_FORMAT }

  validates :username,
            presence: true,
            uniqueness: true,
            format: { with: USERNAME_FORMAT },
            length: { maximum: 40 }

  validates :password,
            presence: true,
            on: [:create, :destroy],
            confirmation: true

  before_save :username_downcase,
              :email_downcase

  before_save :encrypt_password, if: :password

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, INTERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end

  private

  def username_downcase
    self.username = username.downcase
  end

  def email_downcase
    self.email = email.downcase
  end

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, INTERATIONS, DIGEST.length, DIGEST)
      )
    end
  end
end
