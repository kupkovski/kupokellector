Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resource :session, only: [ :new, :create, :destroy ]

  root "dashboard#index"

  resources :collections, only: [ :index, :show ]

  resources :cards, only: [ :index ] do
   member do
     post "collect"
     delete "discard"
   end
  end

  namespace :admin do
    resources :collections do
      resources :cards
    end
  end
end
