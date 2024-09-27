class CreateResults < ActiveRecord::Migration[7.2]
  def change
    create_table :results do |t|
      t.references :exercise, null: false, foreign_key: { to_table: :exercises}
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
