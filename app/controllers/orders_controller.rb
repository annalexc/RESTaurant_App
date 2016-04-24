class OrdersController < ApplicationController

  include SessionsHelper

  def index
    @customer = Customer.find(params[:customer_id])
    @orders = Order.where(customer_id: @customer.id)
   
  end

  def new
    @customer = Customer.find(params[:customer_id])
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
   
  end

  def create
    new_order = Order.create(order_params)
    redirect_to customer_path new_order.customer_id
  end

  def edit
    
  end

  def update
    
  end


  def destroy
  
  end

  private
  def order_params
    params.require(:order).permit(:comments, :customer_id, :item_id)
  end




end
