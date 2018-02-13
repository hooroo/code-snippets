class Snippet < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :comments, as: :commentable

  validates :title, :body, :user_id, :language_id, presence: true
end
