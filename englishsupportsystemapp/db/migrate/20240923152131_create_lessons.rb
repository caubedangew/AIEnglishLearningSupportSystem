class CreateLessons < ActiveRecord::Migration[7.2]
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
