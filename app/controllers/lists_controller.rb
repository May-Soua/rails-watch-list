class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])

  end

  def new
    @list = List.new
  end

  def create
    # 1. Créer la liste
    @list = List.create(list_params)
    # 2. Redirige vers la show (le détail) du restaurant
    redirect_to lists_path(@list), notice: "List was successfully created."
  end

  def destroy
    @list.destroy
    redirect_to lists_path(@list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :id, :action, :controller)
  end
end
