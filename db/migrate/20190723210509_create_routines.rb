class CreateRoutines < ActiveRecord::Migration[5.2]
  def change
    create_table :routines do |t|
      t.belongs_to  :user, index: true
      t.belongs_to  :machine, index: true
      t.string      :name
      t.integer     :repetition
      t.integer     :sets
      t.integer     :weights

      t.timestamps
    end
  end
end
