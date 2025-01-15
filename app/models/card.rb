class Card < ApplicationRecord

  IMAGE_BASE_URL = "https://dz3we2x72f7ol.cloudfront.net/expansions" 
  validates :name, presence: true
  belongs_to :collection

  has_many :user_cards
  has_many :users, through: :user_cards

  def display_collection_number
    formmated_collection_number = collection_number.to_s.rjust(3, "0")
    "#{collection.acronym} (#{formmated_collection_number}/#{collection.total_cards})"
  end

  def image_url
    collection_slug = collection.slug
    collection_acronym = collection.image_acronym
    "#{IMAGE_BASE_URL}/#{collection_slug}/en-us/#{collection_acronym}_EN_#{collection_number}.png"
  end
end
