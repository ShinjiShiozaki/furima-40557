class ItemsController < ApplicationController
  #240508)add
  def new
    @item = Item.new
  end

  def edit
  end

  #240509)add
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  #240508)add
  private

  #240508)add
  def item_params
    params.require(:item).permit(:image, :mei, :setsumei, :category_id, :jyoutai_id, :haisouryou_futan_id, :todoufuken_id, :hassou_nissuu_id, :kakaku).merge(user_id: current_user.id)
  end

end
