class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def index
    # Formオブジェクトのインスタンスを作成して、インスタンス変数に代入する
    @kounyuu_hassousaki = KounyuuHassousaki.new
    @item = Item.find(params[:item_id])
  end

  def create
    # 値をDBへ保存する実装
    @item = Item.find(params[:item_id])
    @kounyuu_hassousaki = KounyuuHassousaki.new(hassousaki_params)
    if @kounyuu_hassousaki.valid?
      @kounyuu_hassousaki.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
  
  private

  def hassousaki_params
    params.require(:kounyuu_hassousaki).permit(:yuubin_bangou, :todoufuken_id, :shikuchouson, :banchi,
      :tatemono, :denwabango).merge(user_id: current_user.id, item_id: @item.id)
  end

end
