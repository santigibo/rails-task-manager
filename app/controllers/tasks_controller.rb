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

  private

  # returns a hash of safe params
  def task_params
    params.require(:task).permit(:title, :description)
  end
end
