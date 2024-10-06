class ChangeUserColumnPasswordAndAddCorrectFlagToAnswer < ActiveRecord::Migration[7.2]
  def change
    rename_column :users, :password, :password_digest
    add_column :answers, :is_correct, :boolean
  end
end
