class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    @order_connection = OrderConnection.new
  end

  def new
  end

  def create
    @order_connection = OrderConnection.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_connection.valid?
      @order_connection.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  def order_params
    params.require(:order_connection).permit(:postal_code, :region_id, :city, :block_number, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

end
