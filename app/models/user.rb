class User < ApplicationRecord
  has_secure_password

  has_many :snippets
  has_many :comments, as: :commentable

  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def to_s
    [first_name, last_name].join(" ").titleize
  end
end
