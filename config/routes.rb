Rails.application.routes.draw do
  resources :uploaded_files, only: [:index, :new, :create, :destroy, :show] do
    get 'history', on: :collection
    get 'storage', on: :collection
    collection do
      get 'trash', to: 'uploaded_files#trash'
      delete 'empty_trash', to: 'uploaded_files#empty_trash'
    end
  end

  root 'homes#index'
end
