class PostsController < ApplicationController
	layout 'landing'
	def index
		@post = Post.all
	  if @post.count > 0
	     flash[:notice] = "Posts display successfully."
	  else
	    flash[:alert] = "Sorry, there were no posts to
	    display."
      end 
	end

	def create
		@post = Post.new(posts_params)
		@post.save
		redirect_to post_path(@post)
	end
	def show
		@post = Post.find(params[:id])
	end
	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:notice] = "Post deleted!"
		else
			flash[:alert] = "There was a problem deleting the post."
		end
		redirect_to posts_path
	end

	def posts_params
		params.require(:post).permit(:title, :text)
	end


end