class Blog < ApplicationRecord
  mount_uploader :blog_images, BlogImagesUploader
  
  JANRE_VALUES = %w(manga anime game movie other)
  
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 1200 }
  validates :janre, inclusion: { in: JANRE_VALUES }
  
  scope :manga, -> { where(janre: 'manga').order(created_at: :desc) }
  scope :anime, -> { where(janre: 'anime').order(created_at: :desc) }
  scope :game, -> { where(janre: 'game').order(created_at: :desc) }
  scope :movie, -> { where(janre: 'movie').order(created_at: :desc) }
  scope :other, -> { where(janre: 'other').order(created_at: :desc) }
  
  belongs_to :user, foreign_key: 'user_id'
  has_many :favorites, foreign_key: 'blog_id', dependent: :destroy
  has_many :users, through: :favorites
  
  class << self
    def janre_text(janre)
      I18n.t("activerecord.attributes.blog.#{janre}")
    end
    
    def janre_options
      JANRE_VALUES.map { |janre| [janre_text(janre), janre] }
    end
  end
end
