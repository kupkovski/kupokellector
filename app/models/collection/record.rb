module Collection
  class Record < ApplicationRecord
    self.table_name = "collections"

    validates :name, :released_at, presence: true

    with_options foreign_key: :collection_id, inverse_of: :collection do
      has_many :cards, class_name: "Card::Record"
    end
  end
end
