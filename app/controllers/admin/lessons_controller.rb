class Admin::LessonsController < Admin::AdminController
  
  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new lesson_params
    @words = Word.search_words_by_category_id @lesson.category_id
    @lesson.words = @words
    if @lesson.save
      flash[:success] = "Create a new lesson successfully!"
      redirect_to admin_lessons_path
    else
      flash[:danger] = "Invalid lesson!"
      render "new"
    end
  end

  def show
    @lesson = Lesson.find params[:id]
    @lesson_words=@lesson.lesson_words
  end

  private
  def lesson_params
    params.require(:lesson).permit(:category_id, :name, :description,  lesson_words_attributes: [:lesson_id, :word_id])
  end
end