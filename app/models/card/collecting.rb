module Card
  class Collecting
    def initialize(user: ,card:)
      @user = user
      @card = card
    end

    def call
      raise "invalid blank user" if user.blank?
      raise "no such user: #{user.id}" unless User.exists?(user.id)
      raise "no such card: #{card.id}" unless Card::Record.exists?(card.id)
      raise "user: #{user.id} already has card: #{card.id}" if user.has_card?(@card)

      user.cards << @card
      user.reload.has_card?(@card)
    end

    private
    attr_reader :card, :user
  end
end
