# frozen_string_literal: true

class EmployersController < ApplicationController
    before_action :authenticate_user
    before_action :role_auth
  
    #added error handling for when the employer fails to save
    def create
      employer = Employer.new(employer_params)
      employer.employer_code = generate_code(12)
      if employer.save
        render json: employer, status: :created
      else
        render json: { error: employer.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    #added error handling for when the employer is not found
    def show
      employer = find_employer
      render json: employer, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Employer not found' }, status: :not_found
    end
  
    #added error handling for when the employer is not found
    def update
      employer = find_employer
      if employer.update(employer_params)
        render json: employer, status: :ok
      else
        render json: { error: employer.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Employer not found' }, status: :not_found
    end
  
    #added error handling for when the employer is not found
    def destroy
      employer = find_employer
      employer.destroy
      head :no_content
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Employer not found' }, status: :not_found
    end
  
    private
  
    def find_employer
      Employer.find(params[:id])
    end
  
    def employer_params
      params.permit(:company_name, :email, :location, :avatar, :description, :verified, :user_code)
    end
  
    def role_auth
      # Get token from request headers
      role = %w[EMPLOYER ADMIN]
      header = request.headers['Authorization']
      token = header.split(' ').last if header
  #added error handling for when the JWT token cannot be decoded,
      if token
        begin
          decoded_token = JWT.decode(token, Rails.application.secret_key_base)
          user_role = decoded_token[0]['role']
          unless role.include?(user_role)
            render json: { error: 'Unauthorized To Access Resource' }, status: :unauthorized
          end
        rescue JWT::DecodeError => e
          render json: { error: e.message }, status: :unauthorized
        end
        #dded error handling for when the Authorization header is not present
      else
        render json: { error: 'Authorization header not present' }, status: :unauthorized
      end
    end
  end
  