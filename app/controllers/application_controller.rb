class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    user_flash_card_path(current_user.id)
  end
end
