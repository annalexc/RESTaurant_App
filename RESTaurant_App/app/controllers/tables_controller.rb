class TablesController < ApplicationController
  include SessionsHelper

  def index
    @tables = Table.all
    @new_table = Table.new
  end

  def new
    @table = Table.new
  end

  def create
    table = Table.create(table_params)
    redirect_to tables_path
  end

  def edit
    @table = table.find(params[:id])
  end

  def update
    table = table.find(params[:id])
    table.update(table_params)
    redirect_to tables_path
  end


  def destroy
    table.destroy(params[:id])
    redirect_to tables_path
  end

  private
  def table_params
    params.require(:table).permit(:table_num, :num_seats, :is_available)
  end






end
