class CustomersController < ApplicationController

  def index
    @customers = Customer.all.order(:id)
  end


  def show
    @customer = Customer.find(params[:id])

    @drinks = [1,2,3,4]
    @appetizers = 5
    @entrees = 6
    @desserts = 7
    @sides = 8
    @num_drinks = 0
    @num_apps = 0
    @num_entrees = 0
    @num_desserts = 0
    @num_sides = 0

    @customer.orders.each do |order|
      if @drinks.include?order.item.itype_id 
        @num_drinks += 1
      elsif order.item.itype_id == @appetizers
        @num_apps += 1
      elsif order.item.itype_id == @entrees
        @num_entrees += 1
      elsif order.item.itype_id == @desserts
        @num_desserts += 1
      elsif order.item.itype_id == @sides
        @num_sides += 1
      end
    end    

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
