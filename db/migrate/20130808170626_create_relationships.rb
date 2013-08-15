class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :title, :null => false
      t.string :name
      t.text :description
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
