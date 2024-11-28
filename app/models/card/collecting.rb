module Card
  class Collecting < Solid::Process
    input do
      attribute :user
      attribute :card

      validates :user, :card, presence: true
    end

    def call(attributes)
      rollback_on_failure {
        Given(attributes)
          .and_then(:check_if_user_already_has_card)
          .and_then(:collect_card)
      }
    end

    private

    def check_if_user_already_has_card(user:, card:, **)
      return Failure(:user_already_has_card, user:, card:) if user.has_card?(card)

      Continue()
    end

    def collect_card(user:, card:, **)
      user.cards << card
      Success(:card_collected, card: card)
    end
  end
end
