class OrdersController < ApplicationController

  include SessionsHelper

  def index
    # @customer = Customer.find(params[:customer_id])
    # @orders = Order.where(customer_id: @customer.id)
    @open_orders = Order.where(is_completed: 0).order(:created_at)

    # @items = Item.all
    # @drinks = Item.where(itype_id: [1,2,3,4])
    # @appetizers = Item.where(itype_id: 5)
    # @entrees = Item.where(itype_id: 6)
    # @desserts = Item.where(itype_id: 7)
    # @sides = Item.where(itype_id: 8)
  
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
    @party = @customer.party.id
    
    customers = Customer.where(party_id: @party)
    indexes = customers.map{|x| x[:id]}
      
      if @party.size > 1
        i = indexes.index(@customer.id)
        if i == (indexes.size-1)
          @next_customer = Customer.find(indexes[0])
        else
          @next_customer = Customer.find(indexes[i+1])
        end
      end
  end

  def show
   
  end

  def create
    new_order = Order.create(order_params)
    redirect_to new_customer_order_path new_order.customer_id

  end

  def edit
    
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to orders_path
  end


  def destroy
    order = Order.find(params[:id])
    order.destroy()
    redirect_to customer_path order.customer_id
  end

  private
  def order_params
    params.require(:order).permit(:comments, :customer_id, :item_id)
  end




end
