class Project < ActiveRecord::Base
  has_many :listtasks, :dependent => :destroy
  belongs_to :owner, :class_name => 'User'
  
  has_many :invites
  has_many :users, :through => :invites

  validates_presence_of :name

  def invited_user
    users.all << owner
  end
end
