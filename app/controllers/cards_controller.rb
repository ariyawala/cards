class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def new
    @card = Card.new
    @list = List.find(params[:list_id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @lists = List.where(user: current_user)
  end

  def update
    if @card.update(card_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to :root
  end

  private

  def card_params
    params.require(:card).permit(:title, :memo, :list_id)
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
