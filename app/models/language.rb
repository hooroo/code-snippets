class Language < ApplicationRecord
  has_many :snippets

  validates :name, presence: true
end
