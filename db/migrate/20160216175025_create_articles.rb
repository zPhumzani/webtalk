class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title, limit: 250
      t.text :body, null: false
      t.boolean :publish, default: false

      t.timestamps null: false
    end
  end
end
