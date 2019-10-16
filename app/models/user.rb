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
end
