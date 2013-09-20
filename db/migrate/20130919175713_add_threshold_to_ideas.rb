class AddThresholdToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :threshold, :integer
  end
end
