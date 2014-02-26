class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  def author
    self.user.user_name
  end
end
