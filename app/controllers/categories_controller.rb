class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save!
      redirect_to movies_path, notice: 'Category created'
    else
      flash[:error] = 'Category not created'
      render :new
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
