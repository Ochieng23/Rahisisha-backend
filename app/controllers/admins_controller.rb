# frozen_string_literal: true

class AdminsController < ApplicationController
    before_action :authenticate_user
    before_action :role_auth

    def create
        admin = Admin.create!(admin_code: generate_code(12), full_name: params[:full_name], email: params[:email], user_code: params[:user_code])
        render json: admin, status: :created
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
        employer.update!(verified: params[:verified])
        render json: employer, status: :ok
    end

    def verify_seeker
        seeker = Seeker.find(params[:id])
        seeker.update!(verified: params[:verified])
        render json: seeker, status: :ok
    end

    private
    def find_admin
        Admin.find(params[:id])
    end
    def role_auth
        # Get token from request headers
        role = "ADMIN"
        header = request.headers['Authorization']
        token = header.split(' ').last if header
        if token
            begin
                decoded_token = JWT.decode(token, Rails.application.secret_key_base)
                user_role = decoded_token[0]['role']
                unless user_role == role
                    render json: {error: 'Unauthorized To Access Resource'}, status: :unauthorized
                end
            end
        end
    end
end
