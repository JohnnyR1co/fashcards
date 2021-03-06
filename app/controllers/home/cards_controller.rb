class Home::CardsController < Home::ApplicationController
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
    Supermemo.new(@card).manage(params[:your_translate])

    respond_to do |format|
      if @card.levenshtein(params[:your_translate])
        format.html { redirect_to random_path, notice: "You are true" }
        format.json
      else
        format.html do
          redirect_to random_path
          flash[:notice] = "You are whrong"
        end
        format.json
      end
    end
  end

  private

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date, :card_picture, :deck_id,
                                   :check, :ef, :repetition_interval, :quality)
    end
end
