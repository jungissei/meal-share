class Cat < ApplicationRecord
  belongs_to :user

  has_many :post_cats, dependent: :destroy
  has_many :posts
  belongs_to :user

end
