Rails.application.routes.draw do
  resources :surveys, only: [:index, :show] do
    member do
      get :new_send
      post :send_email
    end
  end
  root to: 'surveys#index'
end
