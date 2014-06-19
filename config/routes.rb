Rails.application.routes.draw do
  resources :scores, only: [:new, :create, :index]
end
