class CommentsController < ApplicationController

	def index
		#@commentable = find_commentable
 	 	#@comments = @commentable.comments
	end

	def new
		@comment=Comment.new
	end

	def create
		#@commentable=find_commentable

		@comment = @commentable.comments.build(comment_params)
		if(@comment.save!)
			redirect_to @commentable
		else
			render :new
		end
	end

	protected

	def comment_param
		params.require(:comment).permit(:content)
	end

	def find_commentable

		#p "===========#{params[:commentable_type]}----------------"
		params.each do |name, value|
			p "#{name}................#{value}"
			if name=~ /(.+)_id$/
				return $1.classify.constantize.find(value)
			end
		end
		#params[:commentable]
	end
end
