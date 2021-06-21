Rails.application.routes.draw do
  get "/", to: 'projects#index'
  resources :todos
  resources :projects do
    resources :todos
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
