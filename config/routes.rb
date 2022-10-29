Rails.application.routes.draw do
  root "static#index"
  get "events", to: "events#track"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "query", to: "events#query"
end
