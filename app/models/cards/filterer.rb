module Cards
  class Filterer
    def initialize(user:, collection:, query:)
      @user = user
      @collection = collection
      @query = query
    end

    def call
      return owned_cards  if query == "owned"
      return needed_cards if query == "needed"
      collection.cards.order(collection_number: :asc)
    end

    private

    attr_reader :query, :collection, :user

    def owned_cards
      user.cards_from_collection(collection) 
    end

    def needed_cards
      collection.cards - user.cards_from_collection(collection)
    end

    def all_cards
      collection.cards.order(collection_number: :asc)
    end
  end
end
