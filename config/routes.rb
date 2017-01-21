# frozen_string_literal: true
Rails.application.routes.draw do
  resources :events do
    resource :participate, only: :create, module: :events
    resource :decline, only: :destroy, module: :events
  end
  resources :users, param: :username, only: %i(index show)
end
