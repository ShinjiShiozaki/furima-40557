class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :mei, :setsumei, :category_id, :jyoutai_id, :haisouryou_futan_id, :todoufuken_id,
                                 :hassou_nissuu_id, :kakaku).merge(user_id: current_user.id)
  end
end
