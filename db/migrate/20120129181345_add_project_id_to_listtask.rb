class AddProjectIdToListtask < ActiveRecord::Migration
  def change
    add_column :listtasks, :project_id, :integer
  end
end
