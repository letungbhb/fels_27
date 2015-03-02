class RemoveCatIdFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :cat_id, :integer
  end
end
