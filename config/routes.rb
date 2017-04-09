Rails.application.routes.draw do
  devise_for :users
  resources :orids

  root 'orids#index'
end
