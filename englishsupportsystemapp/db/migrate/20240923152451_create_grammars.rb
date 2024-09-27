class CreateGrammars < ActiveRecord::Migration[7.2]
  def change
    create_table :grammars do |t|
      t.string :name
      t.text :explain

      t.timestamps
    end
  end
end
