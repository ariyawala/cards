class ListsController < ApplicationController
  before_action :find_list, only: [:edit, :update, :destroy]
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to :root
  end

  private

  def list_params
    params.require(:list).permit(:title).merge(user_id: current_user.id)
  end

  def find_list
    @list = List.find(params[:id])
  end

end
