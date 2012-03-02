class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :competition
      t.string :category_code
      t.integer :rounds_count

      t.timestamps
    end
    add_index :events, :competition_id
  end
end
