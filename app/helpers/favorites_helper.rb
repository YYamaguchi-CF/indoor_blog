module FavoritesHelper
  def likes_count(blog)
    @likes_count = Favorite.where(blog_id: blog.id).count
  end  	
end
