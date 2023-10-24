Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :fractals do
        member do
          post 'assign_aspect'
        end
      end
      resources :aspects
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static#welcome"
end
