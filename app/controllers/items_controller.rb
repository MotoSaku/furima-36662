class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
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

  def show
    set_item
  end

  def edit
    set_item
    if current_user.id == @item.user_id && !@item.order.present?
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    set_item
    if current_user.id == @item.user_id
      @item.update(item_params)
      redirect_to item_path, method: :get
    else
      render :edit
    end
  end

  def destroy
    set_item
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :overview, :category_id, :status_id, :charge_id, :city_id, :delivery_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

end