class Card < ApplicationRecord
  validates :name, presence: true
  belongs_to :collection

  def display_collection_number
    formmated_collection_number = collection_number.to_s.rjust(3, "0")
    "#{collection.acronym} (#{formmated_collection_number}/#{collection.total_cards})"
  end
end
