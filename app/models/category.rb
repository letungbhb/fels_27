class Category < ActiveRecord::Base
  has_many :lessons
  validates :cat_name, uniqueness: {case_sensitive: false}
end
