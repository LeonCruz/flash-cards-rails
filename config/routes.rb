Rails.application.routes.draw do
  get "flash_cards/index"
  root "home#index"
  devise_for :users, path: "accounts"

  resources :users do
    resources :flash_cards
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
