class ItemsController < ApplicationController
  before_action :set_item!, only: %i[show edit update destroy upvote]

  def index
    @items = Item.all
  end

  def show; end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new item_params
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @item.update item_params
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, info: "Item deleted", status: :see_other
  end

  def upvote
    @item.increment! :votes_count
    redirect_to items_path
  end

  def expensive
    @items = Item.where('price > 5')
    render :index
  end

  private

  def set_item!
    @item = Item.find params[:id]
  end

  def item_params
    params.require(:item).permit(:name, :price, :real, :description)
  end
end
