Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: :sessions,
    registrations: :registrations
  }
  resources :staffs, only: [:create]
  root controller: :schedules, action: :index
  resources :schedules, only: [:index, :show, :create, :new] do
    resources :patterns, only: [:create] do
      resources :shifts, only: [:show, :new, :show, :create]
    end
  end
end
