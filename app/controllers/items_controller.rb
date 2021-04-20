class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :user_item_confirmation, only: [:edit, :update, :destroy]
  before_action :search_item, only: [:index, :search_rk]


  def index
    @items_tag = Item.includes(:user).order('created_at DESC')
    set_item_column
    set_group_column
  end

  def search_rk
    @results = @p.result.includes(:group)  # 検索条件にマッチした商品の情報を取得
    # @results = @p.result  # 検索条件にマッチした商品の情報を取得
  end

  def show
    @comment = Comment.new
    @comments = @items_tag.comments.includes(:user)
  end

  def new
    @items_tag = ItemsTag.new
  end

  def create
    @items_tag = ItemsTag.new(item_params)
    if @items_tag.valid?
      @items_tag.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @items_tag.update(item_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @items_tag.destroy
    redirect_to root_path
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end


  private

  def set_item_column
    @item_title = Item.select("title").distinct
  end

  def set_group_column
    @group_name = Group.select("name").distinct
  end

  def search_item
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def item_params
    params.require(:items_tag).permit(:title, :explanation, :category_id, :condition_id, :shipping_charge_id, :region_id, :price,
                                 :delivery_schedule_id, :group_id,  :message, :name,  images: []).merge(user_id: current_user.id)
  end

  def set_item
    @items_tag = Item.find(params[:id])
  end

  def user_item_confirmation
    if @items_tag.user_id != current_user.id || @items_tag.order_history.present?
      redirect_to action: :index  
    end      
  end

end
