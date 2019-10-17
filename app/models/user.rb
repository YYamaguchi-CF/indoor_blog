class User < ApplicationRecord
	mount_uploader :image, ImageUploader
	before_save { self.email = email.downcase }
	
	validates :name, presence: true, length: { maximum: 20 }
	validates :introduce, length: { maximum: 100 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: { case_sensitive: false }
	                  
	attr_accessor :current_password
	validates :password, presence: { if: :current_password }
	                
	has_secure_password
	
	has_many :blogs, dependent: :destroy
	has_many :favorites
	has_many :favoblogs, through: :favorites, source: :blog
	
	def like(blog)
		favorites.find_or_create_by(blog_id: blog.id)
	end
	
	def unlike(blog)
		favorite = favorites.find_by(blog_id: blog.id)
		favorite.destroy if favorite
	end
	
	def favoblog?(blog)
		self.favoblogs.include?(blog)
	end
end
