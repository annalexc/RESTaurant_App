class OrdersController < ApplicationController

  include SessionsHelper

  def index
   
  end

  def new
     
  
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
