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

  has_many :follows
  has_many :followings, :through => :follows, :source => :following_user

  has_many :followers_follows, :foreign_key => "following_user_id", :class_name => "Follow"
  has_many :followers, :through => :followers_follows, :source => :user


  def following?(user)
    !follows.find_by_following_user_id(user.id).nil?
  end


  def interesting_messages
    Message.where("user_id IN (?)", followings.collect { |f| f.id } + [ id ])
  end

end
