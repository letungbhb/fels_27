class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  has_many :words
end