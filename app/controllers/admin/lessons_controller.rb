class Admin::LessonsController < ApplicationController
  
  def index
    @categories = Category.all
  end

  def new
    @categories = Category.all
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      flash[:success] = "Create a new lesson successfully!"
      redirect_to admin_lessons_path
    else
      flash[:danger] = "Invalid lesson!"
      render "new"
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:category_id, :name)
  end
end