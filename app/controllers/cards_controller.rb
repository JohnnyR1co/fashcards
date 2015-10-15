class CardsController < ApplicationController
  before_filter :require_login
  def index
    @cards = current_user.cards.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new    
  end

  def edit
    @card = Card.find(params[:id])
  end

  def create
    @card = current_user.cards.create(card_params)
  if @card.save
    redirect_to cards_path, notice: "The card was saved"
  else
    render "new"
    end
  end

  def update
    @card = Card.find(params[:id]) 

    if @card.update(card_params)
      redirect_to cards_path, notice: "The card has been updated"
    else
      render "edit"
    end 
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
 
    redirect_to cards_path, notice: "The card has been deleted"
  end

  def random
    @card = current_user.cards.random.order("RANDOM()").take
  end

  def check
    @card = Card.find(params[:id])

    if @card.check_translation(params[:your_translate])
      @card.date_up
      redirect_to random_path, notice: "You are true"
    else
      flash.now[:alert] = "Try again!"
      render "random"
    end
  end

  private
  
    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end 
end
