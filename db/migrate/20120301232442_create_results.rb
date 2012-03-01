class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :competition
      t.references :user
      t.string :event
      t.integer :round, :default => 1
      t.integer :group, :default => 1
      t.decimal :time1  , :precision => 7, :scale => 2
      t.decimal :time2  , :precision => 7, :scale => 2
      t.decimal :time3  , :precision => 7, :scale => 2
      t.decimal :time4  , :precision => 7, :scale => 2
      t.decimal :time5  , :precision => 7, :scale => 2
      t.decimal :average, :precision => 7, :scale => 2
      t.decimal :best   , :precision => 7, :scale => 2
      t.decimal :worst  , :precision => 7, :scale => 2

      t.timestamps
    end
    add_index :results, :competition_id
    add_index :results, :user_id
  end
end
