class WordsController < ApplicationController
  def index
    @words = Word.search params[:content], params[:category_id]
    @words = @words.paginate page: params[:page], per_page: 10
  end
  
end
