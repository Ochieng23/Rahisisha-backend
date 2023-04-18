# frozen_string_literal: true

Rails.application.routes.draw do
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
end
