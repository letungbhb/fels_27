class Answer < ActiveRecord::Base
  before_save {self.content = content.downcase}
  belongs_to :word
end