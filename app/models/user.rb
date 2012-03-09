class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  validates :email, :presence => true,
                    :format => /\A([\w\.]){3,}@([\w\.]){2,}\.([A-Za-z]){2,}\z/,
                    :uniqueness => true

  validates_presence_of :password, :on => :create
  validates :password, :length => { :minimum => 5 }

  has_many :invites
  has_many :projects, :through => :invites


  def list_user
    User.find(:all)
  end
end
