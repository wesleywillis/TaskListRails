class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    id = params[:id]
    @task = Task.find(id)
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params[:task])
    redirect_to '/tasks'
  end

  def delete
    id = params[:id]
    @task =Task.find(id).delete
    redirect_to '/tasks'
  end

  private

  def task_params
    #this makes strong params
    params.permit(task:[:name, :description])
  end
end
