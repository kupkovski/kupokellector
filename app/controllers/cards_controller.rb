class CardsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_card

  def show
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("card-details", partial: "cards/details", locals: { card: @card })
      end
    end
  end


  def collect
    current_user.cards << @card

    user_has_card = current_user.has_card?(@card)
    render turbo_stream: turbo_stream.replace(
      dom_id(@card),
      partial: "collections/card",
      locals: { card: @card, user_has_card: }
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
    @card = Card.find(params[:id])
  end
end
