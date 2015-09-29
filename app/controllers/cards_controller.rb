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

  def edit
    @card = Card.find(params[:id])
  end

  def create
    @card = Card.new(card_params) 

    if @card.save
      redirect_to @card, notice: "The card is saved"
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
    @card = Card.random.order("RANDOM()").take
  end

  def check
    @card = Card.find(params[:id])

    if @card.translated_text == params[:your_translate]
          @card.review_date += 3.days
          @card.save!
          redirect_to random_path, notice: "true"
    else
        render "random"
    end
  end

  private
  
    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end 
end
