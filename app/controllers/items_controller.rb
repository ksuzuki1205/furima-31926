class ItemsController < ApplicationController
  def index
    @items = Item.all
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

  private

  def item_params
    params.require(:item).permit(:title,:explanation,:category_id, :condition_id, :shipping_charge_id, :ship_from_area_id, :region_id, :price, :delivery_schedule_id, :hoge).merge(user_id: current_user.id)
  end

end
