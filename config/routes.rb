Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  root "static#index"
  get "test", to: "static#test"
  get "events", to: "events#track"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "query", to: "events#query"
end
