class Word < ActiveRecord::Base
  before_save {self.content = content.downcase}
  belongs_to :lesson_word
  validates :content, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: lambda {|a| a[:content].blank?}, allow_destroy: true
end
