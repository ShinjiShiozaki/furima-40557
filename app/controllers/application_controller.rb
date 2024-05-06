class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 240506)add
  # before_action :authenticate_user!

  # binding.pry

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :sei_kanji, :mei_kanji, :sei_kana, :mei_kana, :tanjyoubi])
    end

    # binding.pry
  end
end
