# frozen_string_literal: true

class SeekersController < ApplicationController
    before_action :authenticate_user
    def create
        seeker = Seeker.create!(seeker_code: generate_code(12), full_name: params[:full_name], email: params[:email], verified: params[:verified], user_code: params[:user_code])
        render json: seeker, status: :created
    end 
    
    def index
        seekers = Seeker.all
        render json: seekers, status: :ok
    end

    def show
        seeker = find_seeker
        render json: seeker, status: :ok
    end

    def update
        seeker = find_seeker
        seeker.update!(seeker_params)
        render json: seeker, status: :ok
    end    
    
    def destroy
        seeker = find_seeker
        seeker.destroy
        head :no_content
    end

    private
    def find_seeker
        Seeker.find(params[:id])
    end

    def seeker_params
        params.permit(:full_name, :email, :location, :avatar, :description, :verified, :gender, :date_of_birth, :phone_number, :preferred_job, :availability, :minimum_salary)
    end
end
