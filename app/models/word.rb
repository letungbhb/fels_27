class Word < ActiveRecord::Base
  before_save {self.content = content.downcase}

  belongs_to :lesson_word
  belongs_to :category
  has_many :answers, dependent: :destroy

  validates :content, presence: true, 
            length: {maximum: 50}, 
            uniqueness: {case_sensitive: false}

  accepts_nested_attributes_for :answers, 
                  reject_if: lambda {|a| a[:content].blank?}, 
                  allow_destroy: true

  def content_correct_answer
    answers.correct.first.try :content
  end

  def self.search(q, category_id)
    if q && category_id
      where(["content LIKE ? and category_id = ?", "%#{q}%", category_id])
    else
      all
    end
  end
end
