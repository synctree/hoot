class Follow < ActiveRecord::Base
  attr_accessible :following_user_id, :user_id
end
