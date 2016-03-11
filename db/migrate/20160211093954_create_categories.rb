class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, limit: 50
      t.string :slug

      t.timestamps null: false
    end
    add_index :categories, :name, unique: true
    add_index :categories, :slug, unique: true

    Category.create name: "Programming"
    Category.create name: "Ruby"
    Category.create name: "JavaScript"
    Category.create name: "Meteor"
    Category.create name: "Ruby On Rails"
    Category.create name: "Php"
    Category.create name: "Web Development"
    Category.create name: "Html & Css"
    Category.create name: "Technology"
    Category.create name: "Best Practices"
  end
end
