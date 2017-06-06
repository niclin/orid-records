Rails.application.routes.draw do
  devise_for :users

  resources :notifications, only: [:index]

  resources :orids do
    resources :comments
  end

  namespace :admin do
    resources :items, except: [:destroy, :show]
    resources :users do
      member do
        patch :promote
        patch :deomote
      end
    end
  end

  namespace :account do
    resources :users, only: [:index, :update, :show]
    resources :orids do
      member do
        get :markdown
      end
    end
  end

  namespace :item do
    resources :center, only: [:index] do
      member do
        post :buy
      end
    end
    resources :trade_tracking, only: [:index]
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
