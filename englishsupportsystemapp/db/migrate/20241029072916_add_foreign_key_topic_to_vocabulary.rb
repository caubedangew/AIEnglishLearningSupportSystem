class AddForeignKeyTopicToVocabulary < ActiveRecord::Migration[7.2]
  def change
    add_reference :vocabularies, :topic, foreign_key: { to_table: :topics }
    add_reference :vocabularies, :course, foreign_key: { to_table: :courses }
    add_reference :grammars, :course, foreign_key: { to_table: :courses }
  end
end
