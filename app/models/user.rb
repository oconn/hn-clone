class User < ActiveRecord::Base
  has_secure_password
  has_many :decks
  has_many :rounds
  has_many :answers, through: :rounds
  has_many :cards, through: :rounds, through: :answers


  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :password, presence: true

  def all_stats(deck_id)
    self.rounds.where(deck_id: deck_id)
  end
end



