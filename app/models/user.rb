class User < ApplicationRecord
  has_secure_password
  has_many :polls, foreign_key: :created_by
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password_digest
end
