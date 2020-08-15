Rails.application.routes.draw do
  resources :tasks do
    get :active, on: :collection
    get :completed, on: :collection
    post :toggle_all, on: :collection
    post :clear_completed, on: :collection
  end
  root 'tasks#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
