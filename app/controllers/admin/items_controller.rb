class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def update
  end

   private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :prise)
  end

end
