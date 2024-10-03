class User < ApplicationRecord
  has_secure_password

  validates :email, :name, presence: true

  has_many :user_cards
  has_many :cards, through: :user_cards


  def has_card?(card)
    cards.include?(card)
  end


  def cards_from_collection(collection)
    cards.where(collection_id: collection.id)
  end

  def total_cards_from_collection(collection)
    cards_from_collection(collection).count
  end
end
