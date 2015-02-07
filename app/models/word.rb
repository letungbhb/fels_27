class Word < ActiveRecord::Base
  belongs_to :lesson_word
  has_many :answers
end
