class User < ActiveRecord::Base
  has_many :stacks
  has_many :facecards, through: :stacks

  def authenticate(password)
    return true if password == self.password
  end
end
