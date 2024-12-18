class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create ]
  before_action :set_bookmark, only: [:destroy ]

  def new
    @bookmark = Bookmark.new
  end

  def create
  # 1. Récupérer la liste
  # 2. Créer le bookmark avec les strong params
  @bookmark = Bookmark.new(bookmark_params)
  @bookmark.list = @list
  # 4. Sauvegarder en DB
    if @bookmark.save
      # 5. Rediriger vers la show de la list
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end


  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
