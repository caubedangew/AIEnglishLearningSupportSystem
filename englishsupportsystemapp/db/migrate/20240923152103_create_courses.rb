class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :level

      t.timestamps
    end
  end
end
