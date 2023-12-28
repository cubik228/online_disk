Rails.application.routes.draw do
  get '/new', to: 'uploaded_files#new'
  get '/index', to: 'uploaded_files#index'
  get '/uploaded_files/:id', to: 'uploaded_files#show', as: 'uploaded_file'
  get 'homes/index'

  resources :uploaded_files, only: [:index, :new, :create, :destroy]

  root 'homes#index'
end
