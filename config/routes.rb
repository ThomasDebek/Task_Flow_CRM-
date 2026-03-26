Rails.application.routes.draw do
  get "pages/home"
  root to: 'pages#home'
  get "up" => "rails/health#show", as: :rails_health_check
end
