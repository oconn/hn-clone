class Comment < ActiveRecord::Base
  # Remember to create a migration!
  validates :content, presence: true
  belongs_to :post
  belongs_to :user
  has_many :comment_votes

  def author
    self.user.user_name
  end

  def vote_count
    self.comment_votes.count
  end
end
