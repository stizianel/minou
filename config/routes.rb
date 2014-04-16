Minou::Application.routes.draw do
  resources :customers

  resources :timecodes

  resources :timedays do
  	get :statistics, on: :collection
  end

  resources :timesheets

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}

  scope "/admin" do
  	resources :users
  end
 
end