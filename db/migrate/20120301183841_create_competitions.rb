class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.references :user
      t.string :name
      t.string :city
      t.string :address
      t.date :start_on
      t.date :end_on

      t.timestamps
    end
    add_index :competitions, :user_id
  end
end
