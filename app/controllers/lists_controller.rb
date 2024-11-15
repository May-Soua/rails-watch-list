class ListsController < ApplicationController

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

  private

  def list_params
    params.require(:list).permit(:name, :id, :action, :controller)
  end
end
