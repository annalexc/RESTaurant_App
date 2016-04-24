class ItemsController < ApplicationController


  def index
    @items = Item.all
    @drinks = Item.where(itype_id: [1,2,3,4])
    @appetizers = Item.where(itype_id: 5)
    @entrees = Item.where(itype_id: 6)
    @desserts = Item.where(itype_id: 7)
    @sides = Item.where(itype_id: 8)
    @new_item = Item.new
    @itypes = Itype.all
   
  end

  def new
    @new_item = Item.new
    @itypes = Itype.all
  end

  def show
   
  end

  def create
    new_item = Item.create(item_params)
    redirect_to items_path
  end

  def edit
    @item = Item.find(params[:id])
    @itypes = Itype.all
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to items_path
  end


  def destroy
    Item.destroy params[:id]
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:description, :price, :itype_id)
  end




end
