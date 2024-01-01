Rails.application.routes.draw do
  resources :uploaded_files, only: [:index, :new, :create, :destroy, :show] do
    get 'history', on: :collection
    get 'storage', on: :collection
    get 'settings', on: :collection
    collection do
      get 'trash', to: 'uploaded_files#trash'
      delete 'empty_trash', to: 'uploaded_files#empty_trash'
    end
  end

  get '/search', to: 'uploaded_files#search', as: 'search'
  root 'homes#index'
end
