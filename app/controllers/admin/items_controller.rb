class Admin::ItemsController < ApplicationController

  def new
    @new_item = Item.new
  end

  def create
    @new_item = Item.new(item_params)
    if @new_item.save
      redirect_to admin_item_path(@new_item.id)
    else
      render :new
    end
  end

  def index
    @all_item = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
  end
end
