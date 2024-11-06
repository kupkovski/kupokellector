module Card
  class Filtering
    def initialize(user:, collection:, query:, id: nil)
      @user = user
      @collection = collection
      @query = query
      @id = id
    end

    def call
      return Record.find(id) if id.present?
      return owned_cards  if query == "owned"
      return needed_cards if query == "needed"
      collection.cards.order(collection_number: :asc)
    end

    private

    attr_reader :query, :collection, :user, :id

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
