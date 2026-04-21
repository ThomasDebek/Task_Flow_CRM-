class TasksController < ApplicationController
  before_action :set_client
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    @task = @client.tasks.new(status: "pending")
  end

  def create
    @task = @client.tasks.new(task_params)
    if @task.save
      redirect_to @client, notice: "Task created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @client, notice: "Task updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy
    redirect_to @client, notice: "Task deleted."
    else
      redirect_to @client, alert: "Failed to delete task."
    end
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_task
    @task = @client.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date)
  end
end
