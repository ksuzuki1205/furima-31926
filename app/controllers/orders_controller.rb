class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end



  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render action: :index ,model:@order
    end
  end

  def order_params
    params.require(:order).permit(:postal_code, :region_id, :city, :block_number, :phone, :region_id, :price,
                                 :delivery_schedule_id, :image).merge(order_history_id: params[:order_history_id])
  end

end
