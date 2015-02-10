class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :user_id
      t.integer :lesson_id
      t.integer :mark

      t.timestamps null: false
    end
  end
end
