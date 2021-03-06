class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @user.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def order_params
    params.require(:order).permit(:postal_code, :region_id, :city, :block_number, :phone, :region_id, :price,
                                 :delivery_schedule_id, :image).merge(order_history_id: params[:order_history_id])
  end

end
