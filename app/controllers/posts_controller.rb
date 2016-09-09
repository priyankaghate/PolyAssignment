class PostsController < ApplicationController
	before_action :set_id, only:[:show, :edit, :update, :destroy]
	def index
		@posts=Post.all
	end

	def new
		@post=Post.new
		#@comment=@post.comments.build
	end

	def create
		@post=Post.new(post_params)
		if(@post.save!)
			redirect_to @post
		else
			render :new
		end
	end

	def edit
	end

	def show

	end

	def update
		if(@post.update!(post_params))
			redirect_to @post
		else
			render :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	
	protected

	def set_id
		@post=Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end
end
