class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.string :username
      t.references :user
      t.references :category

      t.timestamps null: false
    end
  end
end
