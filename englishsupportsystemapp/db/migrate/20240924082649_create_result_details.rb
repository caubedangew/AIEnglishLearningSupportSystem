class CreateResultDetails < ActiveRecord::Migration[7.2]
  def change
    create_table :result_details do |t|
      t.references :result, null: false, foreign_key: true
      t.float :score
      t.integer :time

      t.timestamps
    end
  end
end
