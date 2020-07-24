class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_uniqueness_of :post_id, scope: :user_id

  #likeが多くついた投稿ランクを取得
  def self.create_all_ranks
    Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

end
