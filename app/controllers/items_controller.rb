class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
  end

  def edit
    return unless user_signed_in? == false || current_user.id != @item.user_id

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy if user_signed_in? && current_user.id == @item.user_id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :mei, :setsumei, :category_id, :jyoutai_id, :haisouryou_futan_id, :todoufuken_id,
                                 :hassou_nissuu_id, :kakaku).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
