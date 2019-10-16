class Blog < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  
  mount_uploader :blog_images, BlogImagesUploader
  
  JANRE_VALUES = %w(manga anime game movie other)
  
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 1200 }
  validates :janre, inclusion: { in: JANRE_VALUES }
  
  class << self
    def janre_text(janre)
      I18n.t("activerecord.attributes.blog.#{janre}")
    end
    
    def janre_options
      JANRE_VALUES.map { |janre| [janre_text(janre), janre] }
    end
  end
end
