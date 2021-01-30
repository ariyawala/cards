class ListsController < ApplicationController
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

  private

  def list_params
    params.require(:list).permit(:title).merge(user_id: current_user.id)
  end

end
