class CreateRoutines < ActiveRecord::Migration[5.2]
  def change
    create_table :routines do |t|
      t.belongs_to  :user
      t.belongs_to  :machine
      t.string      :name
      t.integer     :repetition
      t.integer     :sets
      t.integer     :weights

      t.timestamps
    end
  end
end
