class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :title, limit: 250
      t.text :body, null: false
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.boolean :publish, default: false, null: false
      t.string :slug, null: false

      t.timestamps null: false
    end
    add_index :articles, :slug, unique: true
  end
end
