class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :first_name, presence: true
  validates :last_name, presence: true
end
