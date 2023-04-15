Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :jobs
  resources :jobtags
  resources :seekers
  resources :employers
  resources :admins
  resources :users
  
end
