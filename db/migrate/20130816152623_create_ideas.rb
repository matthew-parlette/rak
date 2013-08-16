class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.integer :relationship_id

      t.timestamps
    end
  end
end
