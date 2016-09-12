class CommentsController < ApplicationController

	def index
		@commentable = find_commentable

 	 	@comments = @commentable.comments
	end

	def new
		@commentable = find_commentable
		p "===========#{params}----------------"
		@comment=@commentable.comments.new
	end

	def create
		@commentable=find_commentable

		@comment = @commentable.comments.build(comment_params)
		if(@comment.save!)
			redirect_to posts_path
		else
			render :new
		end
	end

	protected

	def comment_params
		params.require(:comment).permit(:content)
	end

	def find_commentable

		#p "===========#{params[:commentable_type]}----------------"
		params.each do |name, value|
			#p "#{name}................#{value}"
			if name=~ /(.+)_id$/
				return $1.classify.constantize.find(value)
			end
		end
		nil
	end
end
