class CardsController < ApplicationController
  before_action :require_login
  def index
    @cards = current_user.cards.all
  end

  def new
    @card = Card.new
    @card.deck_id = params[:deck_id]
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
    if params[:search].blank?
      @card = current_user.cards.random.order("RANDOM()").take
    else
      @card = current_user.cards.where(deck_id: params[:search]).random.order("RANDOM()").take
    end
  end

  def check
    @card = Card.find(params[:id])

    if @card.check_translation(params[:your_translate])
      @card.handle_check(params[:your_translate])
      redirect_to random_path, notice: "You are true"
    elsif @card.check_mistakes(params[:your_translate])
      flash.now[:alert] = "You make a mistake your word is #{params[:your_translate]},
                          the translated text is #{@card.translated_text}"
      render "random"
    else @card.handle_check(params[:your_translate])
      flash.now[:alert] = "Try again!"
      render "random"
    end
  end

  private

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date, :card_picture, :deck_id, :check_count)
    end
end
