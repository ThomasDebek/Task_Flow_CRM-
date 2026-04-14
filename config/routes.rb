Rails.application.routes.draw do
  root to: 'pages#home'

  resources :clients


  resources :leads do
    member do
      post :convert
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
