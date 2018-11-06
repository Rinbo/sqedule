Rails.application.routes.draw do
  devise_for :users

  root controller: :schedules, action: :index
  resources :schedules, only: [:index, :show, :create, :new] do
    resources :patterns, only: [:create] do
      resources :shifts, only: [:show]
    end
  end
end
