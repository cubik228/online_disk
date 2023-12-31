Rails.application.routes.draw do
  resources :uploaded_files, only: [:index, :new, :create, :destroy, :show] do
    get 'history', on: :collection
    get 'storage', on: :collection
  end

  root 'homes#index'
end
