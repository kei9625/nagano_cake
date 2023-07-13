class Public::ItemsController < ApplicationController
  def index
    @all_item = Item.all
  end

  def show
  end
end
