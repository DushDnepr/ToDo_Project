class Task < ActiveRecord::Base
  belongs_to :listtask

  validates :listtask_id, :presence => true
  validates :name, :presence => true
  validates_numericality_of :priority, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10

end
