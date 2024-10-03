class CollectionsController < ApplicationController
  def index
    @user = User.last
    @collections = Collection.order(released_at: :desc).all
  end

  def show
    @user = User.last
    @collection = Collection.find(params[:id])
    @cards = @collection.cards.order(collection_number: :asc)
  end
end
