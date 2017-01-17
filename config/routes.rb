Rails.application.routes.draw do
  resources :events, param: :title
  resources :users, param: :username, only: %i(index show)
end
