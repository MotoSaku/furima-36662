class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def edit
  # end

  # def delete
  # end

  private

  def item_params
    params.require(:item).permit(:item_name, :overview, :category_id, :status_id, :charge_id, :city_id, :delivery_id, :price, :image).merge(user_id: current_user.id)
  end

end