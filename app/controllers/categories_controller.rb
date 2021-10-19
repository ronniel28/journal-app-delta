class CategoriesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, except: [:new, :create]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
     flash[:notice] = "Successfully Added"
     redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "successfully edited"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "category deleted"
    redirect_to categories_path
  end

  def set_user
    @category = Category.find(params[:id])
  end

  def require_same_user
    if current_user != @category.user
    flash[:notice] = "You can't perform the action"
    redirect_to root_path
    else
    end
  end

  private
  def category_params
    params.require(:category).permit(:description)
  end
end