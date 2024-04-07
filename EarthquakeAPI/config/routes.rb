Rails.application.routes.draw do
  get 'features/index'
  get 'features/create_comment'
  get "up" => "rails/health#show", as: :rails_health_check

  # config/routes.rb

  resources :features do
    post 'create_comment', to: 'features#create_comment'
  end

end