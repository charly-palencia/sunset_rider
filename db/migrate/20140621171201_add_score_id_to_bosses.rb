class AddScoreIdToBosses < ActiveRecord::Migration
  def change
    create_table :bosses_scores do |t|
      t.integer :boss_id
      t.integer :score_id
    end
  end
end
