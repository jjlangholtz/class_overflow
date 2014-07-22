Rails.application.routes.draw do
  resources :questions, only: [:index, :new, :create]
  resources :answers, only: [:new, :create]
end
