class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :date
      t.decimal :reaction, :precision => 2, :scale => 1 #allows for 3.5
      t.integer :idea_id

      t.timestamps
    end
  end
end
