class Lesson < ActiveRecord::Base
  belongs_to :category
  has_many :results
end