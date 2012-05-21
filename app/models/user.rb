class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  validates :username, 
    :presence   => true,
    :length     => { :minimum => 4, :maximum => 15 },
    :uniqueness => { :case_sensitive => false }

  # attr_accessible :title, :body
  #
  #
  #

  has_many :messages
end
