class AddRefToSomeTables < ActiveRecord::Migration[7.2]
  def change
    add_reference :lessons, :course, foreign_key: { to_table: :courses }
    add_reference :exercises, :lesson, foreign_key: { to_table: :lessons }
    add_reference :answers, :question, foreign_key: { to_table: :questions }
    add_reference :questions, :exercise, foreign_key: { to_table: :exercises }
  end
end
