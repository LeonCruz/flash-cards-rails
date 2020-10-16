class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    user_flash_cards_path(current_user.id)
  end
end
