Rails.application.routes.draw do
  root to: 'pages#home'

  resources :clients do
    resources :tasks, except: [:index, :show]
  end


  resources :leads do
    member do
      post :convert
      patch :advance
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "search", to: "search#index", as: :search
end
