class CollectionsController < ApplicationController
  before_action :load_collection, only: [ :show, :filter ]
  
  def index
    @collections = Collection.order(released_at: :desc).all
  end

  def show
    @user = User.last
    @collection = Collection.find(params[:id])
    @cards = @collection.cards.order(collection_number: :asc)
  end

  def filter
    case params[:q].to_s
    when "owned"
      @cards = current_user.cards_from_collection(@collection) 
    when "needed"
      @cards = @collection.cards - current_user.cards_from_collection(@collection)
    else
      @cards = @collection.cards.order(collection_number: :asc)
    end
    render "show"
  end

  private
  def load_collection
    @collection = Collection.find(params[:id])
    @cards = []
  end
end
