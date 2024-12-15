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
    case Card::Discard.call(user: current_user, card: @card)
    in Solid::Failure(input:)
      respond_to do |format|
        format.turbo_stream { flash.now[:alert] = input.errors.full_messages.join(",") }
      end
    in Solid::Failure(:user_has_no_such_card, _)
      respond_to do |format|
        format.turbo_stream { flash.now[:alert] = "User does not have such card #{@card.name}" }
      end
    in Solid::Success(card:)
      user_has_card = current_user.has_card?(@card)
      render turbo_stream: turbo_stream.replace(
        dom_id(@card),
        partial: "collections/card",
        locals: { card: @card, user_has_card: }
      )
    end
  end

  private

  def set_card
    @card = Card::Record.find(params[:id])
  end
end
