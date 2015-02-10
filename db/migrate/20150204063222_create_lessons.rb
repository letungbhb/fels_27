class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :cat_id
      t.string :name

      t.timestamps null: false
    end
  end
end
