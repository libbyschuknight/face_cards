class User < ActiveRecord::Base
  has_many :stacks
  has_many :facecards, through: :stacks
end
