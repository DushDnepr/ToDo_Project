class Task < ActiveRecord::Base
  enum_attr :state, %w(^new in_work completed), :plural => :state_values
  belongs_to :listtask

  validates_presence_of :listtask_id
  validates_presence_of :name
  validates_numericality_of :priority, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10

end
