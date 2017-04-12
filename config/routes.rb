Rails.application.routes.draw do
  devise_for :users
  resources :orids

  root 'orids#index'

  namespace :admin do
    resources :orids
    resources :users
  end
end
