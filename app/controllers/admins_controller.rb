# frozen_string_literal: true

class AdminsController < ApplicationController
    before_action :authenticate_user
    before_action :role_auth
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActionController::ParameterMissing, with: :missing_parameter
  
    #create a new Admin object with the specified attributes, and if it saves successfully
    def create
      admin = Admin.new(admin_params)
      if admin.save
        render json: admin, status: :created
      else
        render json: { error: admin.errors.full_messages }, status: :unprocessable_entity
      end
    end 
      
    def index
      admins = Admin.all
      render json: admins, status: :ok
    end
  
    def show
      admin = find_admin
      render json: admin, status: :ok
    end
      
    def view_all_employers
      employers = Employer.all
      render json: employers, status: :ok
    end
  
    def verify_employer
      employer = Employer.find(params[:id])
      employer.update(verified: params[:verified])
      render json: employer, status: :ok
    end
  
    def verify_seeker
      seeker = Seeker.find(params[:id])
      seeker.update(verified: params[:verified])
      render json: seeker, status: :ok
    end
  
    private
  
    def admin_params
      params.permit(:admin_code, :full_name, :email, :user_code)
    end
  
    def find_admin
      Admin.find(params[:id])
    end
  
    def role_auth
      role = "ADMIN"
      header = request.headers['Authorization']
      token = header.split(' ').last if header
  
      if token
        begin
          decoded_token = JWT.decode(token, Rails.application.secret_key_base)
          user_role = decoded_token[0]['role']
  
          unless user_role == role
            render json: { error: 'Unauthorized To Access Resource' }, status: :unauthorized
          end
        end
      end
    end
  
    def record_not_found
      render json: { error: 'Record not found' }, status: :not_found
    end
  
    def missing_parameter
      render json: { error: 'Missing parameter' }, status: :unprocessable_entity
    end
  end
  
