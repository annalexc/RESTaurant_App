class CustomersController < ApplicationController

  def index
    @customers = Customer.all.order(:id)
  end

  def menu
    @customer = Customer.find(params[:id])
    @items = Item.all
    @drinks = Item.where(itype_id: [1,2,3,4])
    @appetizers = Item.where(itype_id: 5)
    @entrees = Item.where(itype_id: 6)
    @desserts = Item.where(itype_id: 7)
    @sides = Item.where(itype_id: 8)
    @new_order = Order.new
    @order_size = Order.where(customer_id: @customer.id).size
  end

  def show
    @customer = Customer.find(params[:id])
    @items = Item.all
    @drinks = Item.where(itype_id: [1,2,3,4])
    @appetizers = Item.where(itype_id: 5)
    @entrees = Item.where(itype_id: 6)
    @desserts = Item.where(itype_id: 7)
    @sides = Item.where(itype_id: 8)
    @new_order = Order.new
    @order_size = Order.where(customer_id: @customer.id).size
  end

  def new
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
