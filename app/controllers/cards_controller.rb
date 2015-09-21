class CardsController < ApplicationController
  
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new  
  end

  def create
    @card = Card.new(card_params) 

    if @card.save
      redirect_to @card, :notice => "The card is saved"
    else
      render "new"
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end
 
end

