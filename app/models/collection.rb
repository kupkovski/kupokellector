class Collection < ApplicationRecord
  validates :name, :released_at, presence: true
  has_many :cards, class_name: "Card::Record"
end
