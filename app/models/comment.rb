class Comment < ApplicationRecord
  validates :content, length: { maximum: 100 }
  
  belongs_to :user, optional: true
  belongs_to :blog, optional: true
end
