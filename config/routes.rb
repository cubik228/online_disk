Rails.application.routes.draw do
  resources :uploaded_files, only: [:index, :new, :create, :destroy, :show] do
    get 'history', on: :collection
    get 'storage', on: :collection
    
    collection do
      get 'trash', to: 'uploaded_files#trash'
      delete 'empty_trash', to: 'uploaded_files#empty_trash'
    end
  end
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

  get '/search', to: 'uploaded_files#search', as: 'search'

  resources :settings, only: %i[index] do
    get 'help', on: :collection
  end

  root 'homes#index'
end
