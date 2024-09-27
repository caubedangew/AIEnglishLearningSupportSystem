class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :email
      t.string :last_name
      t.string :username
      t.string :password
      t.string :role
      t.date :date_of_birth
      t.boolean :gender
      t.integer :english_level

      t.timestamps
    end
  end
end
