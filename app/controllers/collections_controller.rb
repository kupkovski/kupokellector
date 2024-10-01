class CollectionsController < ApplicationController
  def index
    @collections = Collection.order(released_at: :desc).all
  end

  def show
    @collection = Collection.find(params[:id])
  end
end
