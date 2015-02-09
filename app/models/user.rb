class User < ActiveRecord::Base
  has_many :results
  validates :username, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  has_secure_password

  scope :normal_users, -> {where(admin: false)}

  def is_supervisor?
   self.admin
  end

  def is_normaluser?
    self.admin
  end
end