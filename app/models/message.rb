class Message < ActiveRecord::Base
  attr_accessible :body, :user_id

  validates :user_id, :presence => true

  belongs_to :user
end
