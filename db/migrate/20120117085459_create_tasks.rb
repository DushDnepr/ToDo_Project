class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :listtask_id
      t.string :name
      t.text :description
      t.boolean :state
      t.integer :priority

      t.timestamps
    end
  end
end
