class AddMarkToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :mark, :integer
  end
end
