module CommentsHelper
	def comments_count(blog)
		 @comments_count = Comment.where(blog_id: blog.id).count
	end
	
	def commented?(blog)
		comment = Comment.find_by(blog_id: blog.id) if login?
		!!comment
	end
end
