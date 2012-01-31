class Project < ActiveRecord::Base
  has_many :listtasks, :dependent => :destroy
  belongs_to :user

  validates_presence_of :name

end
