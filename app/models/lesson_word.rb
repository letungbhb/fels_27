class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word

  accepts_nested_attributes_for :word
end