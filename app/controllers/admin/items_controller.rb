class Admin::ItemsController < ApplicationController

  def new
    @new_item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path(@item.id)
    else
      render :new
    end
  end

  def index
    @all_item = Item.all(item_params)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
  end
end
