class Collection < ApplicationRecord
  validates :name, :acronym, :released_at, :total_cards, presence: true
  has_many :cards
end
