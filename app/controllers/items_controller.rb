class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :user_item_confirmation, only: [:edit, :update, :destroy]
 

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def show
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
  
  def edit
  end

  def update
    if @item.update(item_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :shipping_charge_id, :region_id, :price,
                                 :delivery_schedule_id,  images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_item_confirmation
    if @item.user_id != current_user.id || @item.order_history.present?
      redirect_to action: :index  
    end      
  end

end
