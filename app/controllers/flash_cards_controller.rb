class FlashCardsController < ApplicationController
  def index
    @flash_cards = FlashCard.all
  end

  def new
    @flash_card = current_user.flash_cards.build
  end

  def create
    @flash_card = current_user.flash_cards.build(flash_card_params)

    respond_to do |format|
      if @flash_card.save
        flash[:notice] = "Criado com sucesso"
        format.html { redirect_to action: "index" }
      else
        @flash_card.errors.full_messages.each do |msg|
        end
        format.html { render :new }
      end
    end
  end

  def show
    @flash_card = FlashCard.find(params[:id])
  end

  private

  def flash_card_params
    params.require(:flash_card).permit(:category, :answer, :question, :user_id)
  end
end
