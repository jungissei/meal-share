class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  has_many :post_cats, dependent: :destroy
  has_many :cats, :through => :post_cats
  accepts_nested_attributes_for :post_cats, allow_destroy: true

end
