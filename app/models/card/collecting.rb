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
          # .and_then(:check_presence_of_card)
          # .and_then(:check_existance_of_user)
          # .and_then(:check_existance_of_card)
          # .and_then(:check_if_user_already_has_card)
          .and_then(:collect_card)
      }
    end

    private

    def check_presence_of_user(user:, **)
      Failure(:blank_user, user:) if user.blank?

      Continue()
    end

    def check_presence_of_card(card:, **)
      Failure(:blank_card, card:) if card.blank?

      Continue()
    end

    def check_existance_of_user(user:, **)
      Failure(:no_such_user, user:) unless User.exists?(user.id)

      Continue()
    end

    def check_existance_of_card(card:, **)
      Failure(:no_such_card, card:) unless Card::Record.exists?(card.id)

      Continue()
    end

    def check_if_user_already_has_card(user:, card:, **)
      Failure(:user_already_has_card, user:, card:) if user.has_card?(@card)

      Continue()
    end

    def collect_card(user:, card:, **)
      user.cards << card
      Success(:card_collected, card: card)
    end
  end
end
