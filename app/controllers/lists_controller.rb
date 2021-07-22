class ListsController < ApplicationController
  before_action :find_list, only: [:edit, :update, :show, :destroy ]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new
    end
  end


  def show
    @bookmarks = Bookmark.where(list_id: params[:id])
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo, :comment)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
