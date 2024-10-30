class CardsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_card

  def collect
    collect_card = Card::Collecting.new(user: current_user, card: @card).call
    render turbo_stream: turbo_stream.replace(
      dom_id(@card),
      partial: "collections/card",
      locals: { card: @card, user_has_card: collect_card }
    )
  end

  def discard
    if current_user.cards.find(@card.id)
      current_user.cards.destroy(@card)
    end

    user_has_card = current_user.has_card?(@card)
    render turbo_stream: turbo_stream.replace(
      dom_id(@card),
      partial: "collections/card",
      locals: { card: @card, user_has_card: }
    )
  end

  private

  def set_card
    @card = Card::Record.find(params[:id])
  end
end
