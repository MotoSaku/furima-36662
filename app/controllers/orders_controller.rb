class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :city_id, :municipalities, :address, :building, :tel, :price).merge(user_id: current_user.id)
  end

end
