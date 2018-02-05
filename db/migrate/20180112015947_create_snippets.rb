class CreateSnippets < ActiveRecord::Migration[5.1]
  def change
    create_table :snippets do |t|
      t.references :user, foreign_key: true, index: true
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
