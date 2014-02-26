class PostVote < ActiveRecord::Base
  belongs_to :post
  validates_uniqueness_of :user_id, :scope => "post_id"
end
