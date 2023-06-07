class ApplicationController < ActionController::Base
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :last_name, :first_name, :last_kana, :first_kana, :birth_date]
    )
  end
  
end
