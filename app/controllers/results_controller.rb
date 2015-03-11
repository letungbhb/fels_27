class ResultsController < ApplicationController
  def show
    if params[:words]
      @correct_num = 0
      
      params[:words].values.each do |w|
        answer = Answer.find w
        @correct_num += 1 if answer.correct?
      end

      @lesson = Lesson.find params[:id]
      @lesson.mark = @correct_num
      @lesson.save

      @lesson_words = @lesson.lesson_words

      @choosen_answer = params[:words].values
    end
  end
end
