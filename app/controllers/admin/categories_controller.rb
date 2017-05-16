class Admin::CategoriesController < ApplicationController
  before_filter :authorize_admin

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_param
    params.require(:category).permit(:name)
  end
end
