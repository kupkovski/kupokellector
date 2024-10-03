class CardsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_card

  def collect

    current_user.cards << @card

    render turbo_stream: turbo_stream.replace(
      dom_id(@card),
      partial: "collections/card",
      locals: { card: @card }
    )
  end

  def discard
    if current_user.cards.find(@card.id)
      current_user.cards.destroy(@card)
    end

    render turbo_stream: turbo_stream.replace(
      dom_id(@card),
      partial: "collections/card",
      locals: { card: @card }
    )
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end
end
