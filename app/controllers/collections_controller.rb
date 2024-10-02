class CollectionsController < ApplicationController
  def index
    @collections = Collection.order(released_at: :desc).all
  end

  def show
    @collection = Collection.find(params[:id])
    @cards = @collection.cards.order(collection_number: :asc)
  end
end
