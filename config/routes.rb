Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts do
    resources :comments
  end
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  root to: "users#new"

  get '/:username', to: 'profiles#show', as: :profile
  get '/:username/edit', to: 'profiles#edit', as: :edit_profile
  # post ':username', to: 'profiles#update'
  patch '/:username', to: 'profiles#update'
end
