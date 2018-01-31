class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :body, :commentable_id, :commentable_type, presence: true
end
