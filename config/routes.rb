# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'blobs/show'
    end
  end
  resources :comments
  resources :posts
  resources :jobs
  resources :jobtags
  resources :seekers
  resources :employers, only: [:create, :show, :update, :destroy]
  resources :admins
  resources :users
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # view all employers on platform
  get "/employers/", to: "admins#view_all_employers"

  # verify profiles
  patch "/employers/:id/verify",to: "admins#verify_employer"
  patch "/seekers/:id/verify", to: "admins#verify_seeker"

   # custom job search, e.g. find doctor jobs
   get "/jobs/search/:jobtag_code", to: "jobs#search"

   # custom post search for all user posts
   get "/posts/users/:user_code", to: "posts#user_posts"
 
   # get all post comments based on post_code
   get "/comments/post/:post_code", to: "comments#post_comments"
 
   # generate an access token to enable login
   post '/generate-token/', to: 'auth#login'
 

   namespace :api do
    namespace :v1 do
      resources :blobs, only: [:show]
    end
  end
end
