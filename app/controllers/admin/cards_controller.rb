class Admin::CardsController < ApplicationController
  before_action :set_card, only: %i[ show edit update destroy ]

  # GET /admin/cards or /admin/cards.json
  def index
    @cards = Card.all
  end

  # GET /admin/cards/1 or /admin/cards/1.json
  def show
  end

  # GET /admin/cards/new
  def new
    @card = Card.new
  end

  # GET /admin/cards/1/edit
  def edit
  end

  # POST /admin/cards or /admin/cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to admin_card_path(@card), notice: "Card was successfully created." }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/cards/1 or /admin/cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to admin_card_path(@card), notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/cards/1 or /admin/cards/1.json
  def destroy
    @card.destroy!

    respond_to do |format|
      format.html { redirect_to admin_cards_path, status: :see_other, notice: "Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.require(:card).permit(:name, :collection_number)
    end
end
