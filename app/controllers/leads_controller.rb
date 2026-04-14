class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy, :convert]

  def index
    @leads = Lead.order(created_at: :desc)
  end

  def show
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)

    if @lead.save
      redirect_to @lead, notice: "Lead was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @lead.update(lead_params)
      redirect_to @lead, notice: "Lead was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lead.destroy
    redirect_to leads_path, notice: "Lead was successfully deleted."
  end

  def convert
    client = Client.create(
      name: @lead.full_name,
      email: @lead.email,
      phone: @lead.phone,
      company_name: @lead.company_name,
      status: "active"
    )

    @lead.destroy

    redirect_to client, notice: "Lead was successfully converted to client."
  end

  private

  def set_lead
    @lead = Lead.find(params[:id])
  end

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :email, :phone, :company_name, :status)
  end

end
