class AddLanguageRefToSnippets < ActiveRecord::Migration[5.1]
  def change
    add_reference :snippets, :language, foreign_key: true, null: false
  end
end
