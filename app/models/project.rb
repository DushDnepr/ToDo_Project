class Project < ActiveRecord::Base
  has_many :listtasks, :dependent => :destroy
  #belongs_to :user

  has_many :invites
  has_many :users, :through => :invites

  validates_presence_of :name

end
