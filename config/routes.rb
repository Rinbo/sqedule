Rails.application.routes.draw do
  devise_for :users

  # root :landing_page_controller, action: :index

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root controller: :landing_page, action: :index
end
