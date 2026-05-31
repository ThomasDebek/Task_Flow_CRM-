Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :searches, only: [:index]

  resources :clients do
    resources :tasks, except: [:index, :show]
    resources :notes, only: [:create, :destroy]
  end


  resources :leads do
    member do
      post :convert
      patch :advance
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
