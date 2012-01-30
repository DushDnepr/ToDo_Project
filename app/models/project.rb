class Project < ActiveRecord::Base
  has_many :listtasks, :dependent => :destroy

  validates_presence_of :name

end
