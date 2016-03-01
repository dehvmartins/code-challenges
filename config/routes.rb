Rails.application.routes.draw do
  resources :surveys, only: [:index, :show]
  root to: 'surveys#index'
end
