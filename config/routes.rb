Rails.application.routes.draw do
  get 'shifts/show'
  devise_for :users

  root controller: :schedules, action: :index
  resources :schedules, only: [:index, :show, :create, :new] do
    resources :patterns, only: [:create]
  end
end
