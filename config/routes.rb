Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: :sessions,
    registrations: :registrations
  }
  resources :patterns, only: [:create] do
    resources :shifts, only: [:show, :new, :create]
  end
  resources :staffs, only: [:create]
  root controller: :schedules, action: :index
  resources :schedules, only: [:index, :show, :create, :new] 
end
