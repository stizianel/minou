Minou::Application.routes.draw do
  resources :customers

  resources :timecodes

  resources :timedays

  resources :timesheets

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users
end