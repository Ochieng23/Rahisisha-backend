# frozen_string_literal: true

class CommentsController < ApplicationController
    def create
        comment = Comment.create!(comment_code: generate_code(12), content:params[:content], post_code:params[:post_code], user_code:params[:user_code])
        render json: comment, status: :created
    end

    def index
        comments = Comment.all
        render json: comments
    end 

    def show
        comment = find_comment
        render json: comment, status: :ok
    end

    # '/comment/:id' edits an comment of id in params(Update)
    def update
        comment = find_comment
        comment.update!(comment_params)
        render json: comment, status: :ok
    end

    # get comments based on post_code request
    def post_comments
        comments = Comment.where(post_code: params[:post_code])
        render json: comments, status: :ok
    end

    # '/comment/:id' deletes an comment of id in params(Delete by destroy)
    def destroy
        comment = find_comment
        comment.destroy
        head :no_content
    end

    private
    
    def find_comment
        Comment.find(params[:id])
    end

    def comment_params
        params.permit(:content)
    end
    
end