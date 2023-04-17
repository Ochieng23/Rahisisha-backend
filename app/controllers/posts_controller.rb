# frozen_string_literal: true

class PostsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def create
    post = Post.new(post_params)
    post.post_code = generate_code(12)
    if post.save
      render json: post, status: :created
    else
      render json: { error: post.errors.full_messages }, status: :unprocessable_entity
    end
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
        if post.update(post_params)
          render json: post, status: :ok
        else
          render json: { error: post.errors.full_messages }, status: :unprocessable_entity
        end
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

    def record_not_found(error)
        render json: { error: error.message }, status: :not_found
      end
    
      def record_invalid(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end
end