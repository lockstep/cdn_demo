Rails.application.routes.draw do
  resources :file_uploads, only: [:create] do
    get :download, on: :member
  end
  root 'file_uploads#index'
end
