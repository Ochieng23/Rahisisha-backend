# frozen_string_literal: true

class PostsController < ApplicationController
    def create
        post = Post.create!(post_code: generate_code(12), title:params[:title], media:params[:media], description: params[:description], likes: params[:likes], user_code: params[:user_code])
        render json: post, status: :created
    end

    def index
        posts = Post.all
        render json: posts, status: :ok
    end

    def show
        post = find_post
        render json: post, status: :ok
    end

    # '/post/:id' edits an post of id in params(Update)
    def update
        post = find_post
        post.update!(post_params)
        render json: post, status: :ok
    end

    # show an array of all user posts
    def user_posts
        posts_array = Post.where(user_code: params[:user_code])
        render json: posts_array, status: :ok
    end

    # '/post/:id' deletes a post of id in params(Delete by destroy)
    def destroy
        post = find_post
        post.destroy
        head :no_content
    end

    private
    
    def find_post
        Post.find(params[:id])
    end

    def post_params
        params.permit(:likes, :media, :description, :title)
    end
end
