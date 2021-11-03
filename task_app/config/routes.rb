Rails.application.routes.draw do
  get '/signup', to: 'schedules#new'
  
  root 'static_pages#home'
  
  # get '/home', to: 'static_pages#home'
  
  resources :schedules
end