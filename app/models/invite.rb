class Invite < ActiveRecord::Base
  enum_attr :role, %w(owner ^worker)
  belongs_to :user
  belongs_to :project
  delegate :email, :to => :user, :allow_nil => true
end
