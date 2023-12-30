Rails.application.routes.draw do
  get '/new', to: 'uploaded_files#new'
  get '/index', to: 'uploaded_files#index'
  get '/history', to: 'uploaded_files#history'
  resources :uploaded_files, only: [:index, :new, :create, :destroy, :show, :history]

  root 'homes#index'
end
