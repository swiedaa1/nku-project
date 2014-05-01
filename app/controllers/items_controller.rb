class ItemsController < ApplicationController
  helper_method :sort_column, :sort_direction 
  def index
    @items = Item.order(sort_column + ' ' + sort_direction)
    @category = ['Meat & Seafood', 'Frozen', 'Deli', 'Pet', 'Household', 'Dairy', 'Produce', 'Pantry',
      'Health & Beauty', 'Entertainment', 'Seasonal', 'Baby', 'Bakery', 'Miscellaneous'].sort
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
    @items.name = @items.name.titleize
    @items.user_id = @current.id
    if @items.price == nil # Make sure price isn't blank
      @items.price = '0.00'
    end
    if @items.save
      redirect_to root_path, notice: "Successfully added item to your list. "
    else
      redirect_to root_path, alert: "Item creation failed. Invalid item name or price is not a number."
    end
  end
  def destroy
    doomed_item = Item.find(params[:id])
    doomed_item.destroy
    
    redirect_to items_path, notice: "Successfully removed item from your list. "
  end
  
  private
  def item_params
    params.require(:item).permit(:category, :name, :price, :user_id)
  end
  def sort_column  
    params[:sort] || "name"  # Make this more secure by checking for values
  end   
  def sort_direction  
    params[:direction] || "asc"  # Make this more secure by checking for values
  end  
end