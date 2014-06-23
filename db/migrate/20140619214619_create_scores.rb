class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :name
      t.integer :enemies_killed

      t.timestamps
    end
  end
end
