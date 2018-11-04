Rails.application.routes.draw do
  devise_for :users

  root controller: :landing_page, action: :index
end
