class CollectionsController < ApplicationController
  before_action :load_collection, only: [ :show, :filter ]

  def index
    @collections = Collection.order(released_at: :desc).all
  end

  def show
    @cards = Cards::Filterer.new(user: current_user, collection: @collection, query: "").call
  end

  def filter
    @cards = Cards::Filterer.new(user: current_user, collection: @collection, query: params[:q].to_s).call
    render "show"
  end

  private
  def load_collection
    @collection = Collection.find(params[:id])
    @cards = []
  end
end
