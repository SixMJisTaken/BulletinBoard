Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "users#index"

  resources :users
  resources :posts do
    collection do
      post '/confirm' , to: 'posts#edit_confirm'
      get '/confirm' , to: 'posts#confirm'
      get '/csv', to: 'posts#csv' 
    end
  end
end
