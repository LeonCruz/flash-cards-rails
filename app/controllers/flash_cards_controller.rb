class FlashCardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @flash_cards = FlashCard.all
  end

  def new
    @flash_card = current_user.flash_cards.build
  end

  def create
    @flash_card = current_user.flash_cards.build(flash_card_params)

    if @flash_card.save
      flash[:notice] = "Criado com sucesso"
      redirect_to action: "index"
    else
      render :new
    end
  end

  def show
    @flash_card = FlashCard.find(params[:id])
  end

  def destroy
    @flash_card = FlashCard.find(params[:id])
    @flash_card.destroy

    flash[:notice] = "The Flash Card was successfully destroyed"
    redirect_to action: "index"
  end

  def compare
    your_answer = params[:your_answer]
    @flash_card = FlashCard.find(params[:flash_card_id])

    flash[:notice] = if your_answer == @flash_card.answer
      "Você acertou"
    else
      "Você errou"
    end

    redirect_to user_flash_card_path(id: @flash_card.id)
  end

  private

  def flash_card_params
    params.require(:flash_card).permit(:category, :answer, :question, :user_id)
  end
end
