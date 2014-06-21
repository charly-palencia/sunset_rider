class CreateBosses < ActiveRecord::Migration
  def change
    create_table :bosses do |t|
      t.string :name
      t.string :image_url
      t.integer :points

      t.timestamps
    end
  end
end
