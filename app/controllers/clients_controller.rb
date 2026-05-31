class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = current_user.clients.order(created_at: :desc)
  end

  def show
    @tasks = case params[:task_filter]
             when "pending"
               @client.tasks.pending.order(created_at: :desc)
             when "in_progress"
               @client.tasks.in_progress.order(created_at: :desc)
             when "done"
               @client.tasks.done.order(created_at: :desc)
             when "overdue"
               @client.tasks.overdue.order(created_at: :desc)
             else
               @client.tasks.order(created_at: :desc)
             end
  end

  def new
    @client = Client.new
  end

  def create
    @client = current_user.clients.new(client_params)

    if @client.save
      redirect_to @client, notice: "Client was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: "Client was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: "Client was successfully deleted."
  end

  private

  def set_client
    @client = current_user.clients.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :email, :phone, :company_name, :status)
  end
end
