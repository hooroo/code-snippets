class Snippet < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :commentable

  validates :title, :body, :user_id, presence: true
end
