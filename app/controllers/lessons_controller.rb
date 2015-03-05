class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find params[:id]
    @lesson_words = @lesson.lesson_words
  end
end
