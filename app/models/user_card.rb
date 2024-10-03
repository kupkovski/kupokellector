class UserCard < ApplicationRecord
  belongs_to :card
  belongs_to :user

  after_create_commit { create_broadcast }
  after_destroy_commit { create_broadcast }

  private

  def create_broadcast
    card_collection = card.reload.collection
    total_collected_cards = user.reload.total_cards_from_collection(card_collection)

    broadcast_update_to "user_cards_count",
      partial: "collections/cards_total",
      locals: { total_collected_cards: },
      target: "user_cards_count"

    broadcast_update_to "card_#{card.id}",
      partial: "collections/card",
      locals: { card:, user: },
      target: "card_#{card.id}"
  end
end
