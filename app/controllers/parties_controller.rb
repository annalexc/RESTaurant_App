class PartiesController < ApplicationController

  include SessionsHelper

  def index
    @new_party = Party.new
    @tables = Table.all.order(:id)
  end

  def new
    @party = Party.new
    @table = Table.find(params[:table_id])
  end

  def show
    @party = Party.find(params[:id])
    @customers = Customer.where(party_id: @party.id)
    @total = 0
    @customers.each do |customer|
      customer.orders.each do |order|
        @total += order.item.price
      end
      @total_bill = @total
    end

  end

  

  def create
    party = Party.create(party_params.merge({user_id: current_user.id}))
    current_table = Table.find(party.table_id)
    current_table.update_column(:is_available, 0)
    for i in 1..party.size
      Customer.create(customer_num: i, party_id: party.id)
    end
    redirect_to party_path(party.id)
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    party = Party.find(params[:id])
    party.update(party_params)
    if (party.is_paid == 1)
      party.table.update_column(:is_available, 1)
    end
    redirect_to parties_path
  end


  def destroy
    party.destroy(params[:id])
    redirect_to profile_path
  end

  private
  def party_params
    params.require(:party).permit(:is_paid, :size, :user_id, :table_id)
  end


end
