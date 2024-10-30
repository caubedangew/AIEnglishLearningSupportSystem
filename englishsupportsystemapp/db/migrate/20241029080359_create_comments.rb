class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.text :content
      t.references :parent_comment, null: true, foreign_key: { to_table: :comments }

      t.timestamps
    end
  end
end
