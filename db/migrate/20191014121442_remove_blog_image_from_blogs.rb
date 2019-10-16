class RemoveBlogImageFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :blog_image, :string
  end
end
