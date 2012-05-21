class Follow < ActiveRecord::Base
  attr_accessible :following_user_id, :user_id

  belongs_to :user
  belongs_to :following_user, :class_name => "User"
end
