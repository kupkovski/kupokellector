module Card
  class Discard < Solid::Process
    input do
      attribute :user
      attribute :card

      validates :user, :card, presence: true
    end

    def call(attributes)
      rollback_on_failure {
        Given(attributes)
          .and_then(:check_if_user_has_card)
          .and_then(:discard_card)
      }
    end

    private

    def check_if_user_has_card(user:, card:, **)
      return Failure(:user_has_no_such_card, user:, card:) unless user.has_card?(card)

      Continue()
    end

    def discard_card(user:, card:, **)
      user.cards.destroy(card)
      Success(:card_discarded, card: card)
    end
  end
end
