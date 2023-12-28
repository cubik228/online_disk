Rails.application.routes.draw do
  get '/new', to: 'uploaded_files#new'
  get '/index', to: 'uploaded_files#index'
  get 'homes/index'

  resources :uploaded_files, only: [:index, :new, :create, :destroy, :show]

  root 'homes#index'
end
