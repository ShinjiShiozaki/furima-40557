class ItemsController < ApplicationController
  
  #240508)add
  def new
    @item = Item.new
  end

  #240508)add
  def create
    Item.create(item_params)
    redirect_to '/'
  end

  #240508)add
  private

  #240508)add
  def item_params
    #params.require(:item).permit(:image, :text).merge(user_id: current_user.id)
    params.require(:item).permit(:image, :mei, :setsumei, :category_id, :jyoutai_id, :haisouryou_futan_id, :todoufuken_id, :hassou_nissuu_id, :kakaku)
  end

end
