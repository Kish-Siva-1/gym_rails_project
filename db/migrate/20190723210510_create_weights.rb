class CreateWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :weights do |t|
      t.belongs_to  :routine
      t.belongs_to  :machine

      t.string     :weight

      t.timestamps
    end
  end
end
