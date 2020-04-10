Rails.application.routes.draw do
  root to: 'matches#index'
  resources :teams, only: %i[index show]
  resources :significatives, only: :index do
    resources :teams, only: %i[index show], module: :significatives
    resources :players, only: %i[update show], module: :significatives
  end
end
