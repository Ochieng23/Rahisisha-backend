# frozen_string_literal: true

class UsersController < ApplicationController
    before_action :authenticate_user, except: :create
    def create
        user = User.create!(user_code: generate_code(12), username: params[:username], role: params[:role], password: params[:password], password_confirmation: params[:password_confirmation])
        render json: user, status: :created
    end 
    
    def index
        users = User.all
        render json: users, status: :ok
    end

    def show
        user = find_user
        render json: user, status: :ok
    end

    def update
        user = find_user
        user.update!(user_params)
        render json: user, status: :ok
    end
    
    def destroy
        user = find_user
        user.destroy
        head :no_content
    end

    private
    def find_user
        User.find(params[:id])
    end

    def user_params
        params.permit(:username, :password, :role, :password_confirmation)
    end
end
