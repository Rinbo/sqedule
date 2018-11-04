Rails.application.routes.draw do
  get 'planning_pages/index'
  devise_for :users

  root controller: :landing_page, action: :index
  resources :planning_pages, only: [:index]
end
