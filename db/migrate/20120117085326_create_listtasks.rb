class CreateListtasks < ActiveRecord::Migration
  def change
    create_table :listtasks do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
