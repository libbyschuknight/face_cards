class User < ActiveRecord::Base
  has_many :stacks
  has_many :facecards, through: :stacks

  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+{2,}\z/}
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  def authenticate(password)
    return true if password == self.password
  end
end
