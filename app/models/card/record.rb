module Card
  class Record < ApplicationRecord
    self.table_name = "cards"

    validates :name, presence: true

    belongs_to :collection, class_name: "Collection::Record"

    has_many :user_cards
    has_many :cards, through: :user_cards

    def display_collection_number
      formmated_collection_number = collection_number.to_s.rjust(3, "0")
      "#{collection.acronym} (#{formmated_collection_number}/#{collection.total_cards})"
    end
  end
end
