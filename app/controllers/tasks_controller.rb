class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    t = Task.create(task_params)

    redirect_to show_path(t.id)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    t = Task.find(params[:id])
    t.update(task_params)
    redirect_to show_path(t.id)
  end

  def destroy
    t = Task.find(params[:id])
    t.destroy

    redirect_to tasks_path
  end

  private

  # returns a hash of safe params
  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end
end
