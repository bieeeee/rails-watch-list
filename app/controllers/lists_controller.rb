class ListsController < ApplicationController
  before_action :set_lists

  def index
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: 303
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_lists
    @lists = List.all
  end
end
