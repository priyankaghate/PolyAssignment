class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	has_many :comments, as: :commentable
	#accepts_nested_attributes_for :comments
end
