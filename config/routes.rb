Rails.application.routes.draw do
  root "home#index"
  devise_for :users, path: "accounts"

  resources :users do
    resources :flash_cards do
      post "compare", to: "flash_cards#compare"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
