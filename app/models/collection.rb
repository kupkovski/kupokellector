class Collection < ApplicationRecord
  validates :name, :released_at, presence: true
  has_many :cards
end
