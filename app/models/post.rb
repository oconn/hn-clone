class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_votes

  def author
    self.user.user_name
  end

  def vote_count
    self.post_votes.count
  end
end
