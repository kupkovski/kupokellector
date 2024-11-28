class CardsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_card

  def collect
    case Card::Collecting.call(user: current_user, card: @card)
    in Solid::Failure(input:)
      respond_to do |format|
        format.turbo_stream { flash.now[:alert] = input.errors.full_messages.join(",") }
      end
    in Solid::Failure(:user_already_has_card, _)
      respond_to do |format|
        format.turbo_stream { flash.now[:alert] = "User already has card #{@card.name}" }
      end
    in Solid::Success(card:)
      render turbo_stream: turbo_stream.replace(
        dom_id(@card),
        partial: "collections/card",
        locals: { card: @card, user_has_card: true }
      )
    end
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
