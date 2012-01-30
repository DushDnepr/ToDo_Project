class Listtask < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
  belongs_to :project

  validates_presence_of :name

end
