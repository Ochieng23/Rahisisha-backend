# frozen_string_literal: true

class JobsController < ApplicationController
    before_action :role_auth, only: [:create, :update, :destroy]


    def create
        job = Job.create!(job_code: generate_code(12), job_name: params[:job_name], jobtag_code: params[:jobtag_code], employer_code: params[:employer_code])
        render json: job, status: :created
    end

    def index
        jobs = Job.all
        render json: jobs, status: :ok
    end

    def show
        job = find_job
        render json: job, status: :ok
    end

    # '/job/:id' edits an job of id in params(Update)
    def update
        job = find_job
        job.update!(job_params)
        render json: job, status: :ok
    end
    
    # allows searching for jobs based on tags and renders them
    def search
        jobs = Job.where(jobtag_code: params[:jobtag_code])
        render json: jobs, status: :ok
    end

    # '/job/:id' deletes a job of id in params(Delete by destroy)
    def destroy
        job = find_job
        job.destroy
        head :no_content
    end

    private
    
    def find_job
        Job.find(params[:id])
    end

    def job_params
        params.permit(:name, :jobtag_code)
    end
    
    def role_auth
        # Get token from request headers
        role = ["EMPLOYER", "ADMIN"]
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
