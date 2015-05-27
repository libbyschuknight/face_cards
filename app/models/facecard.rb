class Facecard < ActiveRecord::Base
  belongs_to :facecard
  belongs_to :user
end
