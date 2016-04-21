class CustomersController < ApplicationController

  def index
    @customers = Customer.all.order(:id)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    new_customer = Customer.create(customer_params)
  end

  def edit
    @customer = Customer.find(params[:id])
    @traveler = Traveler.where(id: params[:traveler_id])
  end

  def update
    customer = Customer.find params[:id]
    customer.update(customer_params)
    redirect_to customer_path customer.id
  end

  def destroy
    customer.destroy params[:id]
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_num, :party_id)
  end


end
