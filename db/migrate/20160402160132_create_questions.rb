class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.string :username
      t.references :user
      t.references :category

      t.timestamps null: false
    end
  end
end
