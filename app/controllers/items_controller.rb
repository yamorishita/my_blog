class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @item = Item.all
  end

  def show
    @item = Item.find(params@[:id])
  end

  def new
    @item = Item.new(item_params)
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to "/item/#{@item.id}"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :body, :category)

  private
  def set_item
   @item = Item.find(params[:id])
  end

end
