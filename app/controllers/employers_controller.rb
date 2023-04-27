# frozen_string_literal: true

class EmployersController < ApplicationController
    before_action :authenticate_user
    before_action :role_auth

    def index 
        employers = Employer.all
        render json: employers
    end 
    def create
        employer = Employer.create!(employer_code: generate_code(12), company_name: params[:company_name], email: params[:email], verified: params[:verified], user_code: params[:user_code])
        render json: employer, status: :created
    end   
    
    def show
        employer = find_employer
        render json: employer, status: :ok
    end

    def update
        employer = find_employer
        employer.update!(employer_params)
        render json: employer, status: :ok
    end    
    
    def destroy
        employer = find_employer
        employer.destroy
        head :no_content
    end

    private

    def find_employer
        Employer.find(params[:id])
    end

    def employer_params
        params.permit(:company_name, :email, :location, :avatar, :description, :verified)
    end

    def role_auth
        # Get token from request headers
        role = ["employer", "admin"]
        header = request.headers['Authorization']
        token = header.split(' ').last if header
        if token
            begin
                decoded_token = JWT.decode(token, Rails.application.secret_key_base)
                user_role = decoded_token[0]['role']
                unless  role.include?(user_role)
                    render json: {error: 'Unauthorized To Access Resource'}, status: :unauthorized
                end
            end
        end
    end
end
