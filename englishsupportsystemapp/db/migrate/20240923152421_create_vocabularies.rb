class CreateVocabularies < ActiveRecord::Migration[7.2]
  def change
    create_table :vocabularies do |t|
      t.string :name
      t.string :meaning
      t.string :pronounce

      t.timestamps
    end
  end
end
