class Word < ActiveRecord::Base
  before_save {self.content = content.downcase}

  has_many :lesson_words
  has_many :lessons, through: :lesson_words
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

  def self.search_words_by_category_id(category_id)
    where("category_id = ?",category_id).order("RAND()").limit(20)
  end

end
