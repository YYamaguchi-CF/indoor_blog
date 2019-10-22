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
	has_many :favorites, dependent: :destroy
	has_many :favoblogs, through: :favorites, source: :blog
	has_many :relationships
	has_many :followings, through: :relationships, source: :follow
	has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
	has_many :followers, through: :reverses_of_relationship, source: :user
	has_many :comments
	has_many :blog, through: :comments
	
	# お気に入り
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
	# フォローフォロワー	
	def follow(other_user)
		unless self == other_user
			self.relationships.find_or_create_by(follow_id: other_user.id)
		end
	end

	def unfollow(other_user)
		relationship = self.relationships.find_by(follow_id: other_user.id)
		relationship.destroy if relationship
	end
	
	def following?(other_user)
		self.followings.include?(other_user)
	end
end
