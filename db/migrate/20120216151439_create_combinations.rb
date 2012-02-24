class CreateCombinations < ActiveRecord::Migration
  def change
    create_table :combinations do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :role

      t.timestamps
    end
  end
end
