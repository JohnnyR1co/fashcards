class DecksController < ApplicationController
  before_filter :require_login
  def index
    @decks = current_user.decks.all
  end

  def new
    @deck = Deck.new
  end

  def edit
    @deck = Deck.find(params[:id])
  end

 def create
    @deck = current_user.decks.create(deck_params)
    if @deck.save
      redirect_to decks_path, notice: "The deck was saved"
    else
      render "new"
    end
  end
  
  def update
    @deck = Deck.find(params[:id]) 

    if @deck.update(deck_params)
      redirect_to decks_path, notice: "The deck has been updated"
    else
      render "edit"
    end 
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
 
    redirect_to decks_path, notice: "The deck has been deleted"
  end

  private

    def deck_params
      params.require(:deck).permit(:name)
    end 
end
