class Admin::CategoriesController < Admin::AdminController
 
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Create a new category successfully!"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Invalid category!"
      render "new"
    end
  end

  private
  def category_params
    params.require(:category).permit(:cat_name, :icon)
  end

end