# frozen_string_literal: true

class UsersController < ApplicationController
    before_action :authenticate_user, except: :create
  
    #user input is valid before attempting to save the record to the database.
    def create
        user = User.new(user_params)
        user.user_code = generate_code(12)
        
        if user.save
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
  
    def index
      users = User.all
      render json: users, status: :ok
    end
  
    def show
      user = find_user
      render json: user, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    #user input is valid before attempting to save the record to the database.
    def update
      user = find_user
      if user.update(user_params)
        render json: user, status: :ok
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    def destroy
      user = find_user
      user.destroy
      head :no_content
      #exceptions that may be raised when trying to find a user by ID that doesn't exist
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    private
  
    def find_user
      User.find(params[:id])
    end
  
    def user_params
      params.permit(:username, :password, :role, :password_confirmation)
    end
  end
  