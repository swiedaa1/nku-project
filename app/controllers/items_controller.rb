class ItemsController < ApplicationController
  def index
    @items = Item.all
    @category = ['Meat', 'Frozen', 'Deli', 'Pet', 'Cleaning', 'Dairy', 'Produce', 'Pantry']
  end
  def new
    @items = Item.new
  end
  def show
    redirect_to root_path
  end
  def create
    @current = current_user
    @items = Item.new(item_params)
    @items.user_id = @current.id
    if @items.save
      redirect_to root_path, alert: "Successfully added item to your list. "
    else
      render 'new'
    end
  end
  def destroy
    doomed_item = Item.find(params[:id])
    doomed_item.destroy

    redirect_to root_path, alert: "Item deleted." 
  end
  
  private
  def item_params
    params.require(:item).permit(:category, :name, :user_id)
  end
end

