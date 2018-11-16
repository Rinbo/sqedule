Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: :sessions,
    registrations: :registrations
  }
  resources :patterns, only: [:create, :new, :edit, :update, :destroy] do
    resources :shifts, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :staffs, only: [:create, :new, :edit, :update, :destroy] do
    resources :assignments, only: [:create, :new, :edit, :update, :destroy]
  end
  
  post 'schedules/optimizer'
  root controller: :schedules, action: :index
  resources :schedules, only: [:index, :show, :create, :new,] 
end
