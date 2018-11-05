Rails.application.routes.draw do
  devise_for :users

  root controller: :schedules, action: :index
  resources :schedules, only: [:index]
end
