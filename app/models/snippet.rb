class Snippet < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :snippet_tags

  validates :title, :body, presence: true
end
