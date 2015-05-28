class Stack < ActiveRecord::Base
  belongs_to :user
  has_many :facecards
end
