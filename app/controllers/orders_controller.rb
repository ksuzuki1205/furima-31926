class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :finding_item, only: [:index, :create]
  before_action :confirmation, only: [:index, :create]

  def index
    @order_connection = OrderConnection.new
  end

  def create
    cus_token = current_user.card.customer_token
    @order_connection = OrderConnection.new(order_params)
    if @order_connection.valid?
      pay_item(cus_token)
      @order_connection.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def confirmation
    if @item.user_id == current_user.id || @item.order_history.present?
      redirect_to root_path  
    end
  end

  def finding_item
   @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_connection).permit(:postal_code, :region_id, :city, :block_number, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: current_user.card.customer_token )
  end

  def pay_item(token)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      customer: token,    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
