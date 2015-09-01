Rails.application.routes.draw do
  resources :file_uploads, only: [:create, :show] do
    get :download, on: :member
  end
  root 'file_uploads#index'
end
