class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @completed_tasks = @tasks.where.not(completed: nil)
    @current_tasks = @tasks.where(completed: nil)
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

  def destroy
    id = params[:id]
    @task =Task.find(id).destroy
    redirect_to '/tasks'
  end

  def update
    id = params[:id]
    task = Task.find(id)
    task.update(completed: Time.now)
    redirect_to '/tasks'
  end

  #def completed_tasks
  #  @tasks.where.not(completed_at: nil)
  #end

  #def current_tasks
  #  @tasks.where(completed_at: nil)
  #end

  private

  def task_params
    #this makes strong params
    params.permit(task:[:name, :description])
  end
end
