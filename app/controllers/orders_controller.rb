class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :finding_item, only: [:index, :create]

  def index
    @order = Order.new
    @order_connection = OrderConnection.new
    if @item.user_id == current_user.id || @item.order_history.present?
      redirect_to root_path  
    else
      render action: :index
    end
  end

  def new
  end

  def create
    @order_connection = OrderConnection.new(order_params)
    if @order_connection.valid?
      pay_item
      @order_connection.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def finding_item
   @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_connection).permit(:postal_code, :region_id, :city, :block_number, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
