# frozen_string_literal: true

class JobtagsController < ApplicationController
    def create
        job_tag = Jobtag.create!(jobtag_code: generate_code(12), group_name: params[:group_name])
        render json: job_tag, status: :created
    end 
    
    def index
        jobtags = Jobtag.all
        render json: jobtags, status: :ok
    end

    def show
        job_tag = find_jobtag
        render json: job_tag, status: :ok
    end

    def update
        job_tag = find_jobtag
        job_tag.update!(group_name: params[:group_name])
        render json: job_tag, status: :ok
    end
    
    def destroy
        job_tag = find_jobtag
        job_tag.destroy
        head :no_content
    end

    private
    def find_jobtag
        Jobtag.find(params[:id])
    end
end
