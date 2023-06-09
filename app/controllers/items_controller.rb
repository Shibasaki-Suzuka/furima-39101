class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_edit_soldout, only: [:edit, :update, :destroy]
  before_action :move_to_edit, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
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
    params.require(:item).permit(:image, :item_name, :sentence, :category_id, :status_id, :postage_burden_id, :prefecture_id,
                                 :shipping_day_id, :selling_price).merge(user_id: current_user.id)
  end

  def move_to_edit
    redirect_to root_path unless current_user == @item.user
  end

  def move_to_edit_soldout
    redirect_to root_path if Order.exists?(item_id: @item)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
