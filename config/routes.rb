Rails.application.routes.draw do
  root to: 'surveys#index'
  
  resources :surveys, only: [:index, :show] do
    member do
      get :new_send
      get :respond
      post :send_email
    end
  end
  resources :votes, only: [:create]
end
