class AddBlogImagesToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :blog_images, :string
  end
end
