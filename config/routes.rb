Rails.application.routes.draw do
  devise_for :users

  resources :orids do
    resources :comments
  end

  namespace :admin do
    resources :orids
    resources :users do
      member do
        patch :promote
        patch :deomote
      end
    end
  end

  namespace :account do
    resources :users, only: [:show]
  end

  resources :orders do
    collection do
      get :checkout
    end

    member do
      get :pay
    end
  end

  root 'welcome#index'
end
