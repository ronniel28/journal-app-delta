class TasksController < ApplicationController
  def index
    @tasks= Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "task successfully added"
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "task successfully updated"
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task Deleted"
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:description, :date, :category_id)
  end
end
