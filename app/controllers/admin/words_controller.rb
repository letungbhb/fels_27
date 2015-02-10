class Admin::WordsController < Admin::AdminController
  def index
    @words = Word.all
  end

  def new
    @word = Word.new
    4.times do
      @answer = @word.answers.build
    end 
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = "Create a new word successfully!"
      redirect_to admin_words_path(@answer)
    else
      flash[:danger] = "Invalid word!"
      render "new"
    end
  end

  def show
    @word = Word.find params[:id]
  end

  private
  def word_params
    params.require(:word).permit(:content, answers_attributes: [:content, :correct])
  end
end
