class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, except: [:new, :create]
  def index
    @categories = Category.all
    cate = params[:cate]
    if !cate.nil?
      @tasks = Task.where(:category_id => cate)
    else
        @tasks= Task.all
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      flash[:notice] = "task successfully added"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
   
    if @task.update(task_params)
      flash[:notice] = "task successfully updated"
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    
    @task.destroy
    flash[:notice] = "Task Deleted"
    redirect_to tasks_path
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def require_same_user
    if current_user != @task.user
      flash[:notice] = "You Can't Perform The Action"
      redirect_to root_path
    end
  end

  private
  def task_params
    params.require(:task).permit(:description, :date, :category_id, :user_id)
  end
end
