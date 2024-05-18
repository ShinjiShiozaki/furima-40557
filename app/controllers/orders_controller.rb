class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    #@kounyuu_hassousaki = KounyuuHassousaki.new
  end

  def index
    # Formオブジェクトのインスタンスを作成して、インスタンス変数に代入する
    @kounyuu_hassousaki = KounyuuHassousaki.new
    #@order = Order.find(hassousaki_params[:id])
  end

  def create
    # 値をDBへ保存する実装
    # binding.pry
    @kounyuu_hassousaki = KounyuuHhassousaki.new(hassousaki_params)
    if kounyuu_hassousaki.valid?
      @kounyuu_hassousaki.save
      redirect_to root_path
    else
      #render :new, status: :unprocessable_entity
      render :create, status: :unprocessable_entity
    end
  end
  
  private

  def hassousaki_params
    params.require(:kounyuu_hassousaki).permit(:yuubin_bangou, :todoufuken_id, :shikuchouson, :banchi, :tatemono, :denwabango, :kounyuu_id, :item_id).merge(user_id: current_user.id)
  end

end
