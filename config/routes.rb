Rails.application.routes.draw do
  resources :events
  resources :users, param: :username, only: %i(index show)
end
