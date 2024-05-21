class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def index
    # binding.pry
    # if Kounyuu.exists?(item_id: item.id)
    #  redirect_to root_path
    # end
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    # Formオブジェクトのインスタンスを作成して、インスタンス変数に代入する
    @kounyuu_hassousaki = KounyuuHassousaki.new
    @item = Item.find(params[:item_id])
  end

  def create
    # 値をDBへ保存する実装
    @item = Item.find(params[:item_id])
    @kounyuu_hassousaki = KounyuuHassousaki.new(hassousaki_params)
    if @kounyuu_hassousaki.valid?
      pay_item
      @kounyuu_hassousaki.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def hassousaki_params
    params.require(:kounyuu_hassousaki).permit(:yuubin_bangou, :todoufuken_id, :shikuchouson, :banchi,
                                               :tatemono, :denwabango).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.kakaku,                 # 商品の値段
      card: hassousaki_params[:token],      # カードトークン
      currency: 'jpy'                       # 通貨の種類（日本円）
    )
  end
end
