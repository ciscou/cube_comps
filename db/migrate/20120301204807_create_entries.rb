class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :user
      t.references :competition

      t.timestamps
    end
    add_index :entries, :user_id
    add_index :entries, :competition_id
  end
end
