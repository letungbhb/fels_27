class RemoveDescriptionFromLesson < ActiveRecord::Migration
  def change
    remove_column :lessons, :description, :string
  end
end
