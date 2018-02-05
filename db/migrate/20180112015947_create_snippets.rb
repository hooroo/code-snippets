class CreateSnippets < ActiveRecord::Migration[5.1]
  def change
    create_table :snippets do |t|
      t.integer :user_id, foreign_key: true, index: true, null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
