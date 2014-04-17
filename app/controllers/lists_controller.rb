class ListsController < ApplicationController
  def index
    @category = ['Meat', 'Frozen', 'Deli', 'Pet', 'Cleaning', 'Dairy', 'Produce', 'Pantry']
    @lists = List.all
  end
  def new
    @lists = List.new
  end
  def show
    redirect_to root_path
  end
  def create

    @lists = List.new(list_params)
    if @lists.save
      redirect_to root_path, alert: "Successfully added item to your list. "
    else
      render 'new'
    end
  end
  def destroy
    test = List.find(params[:id])
    test.destroy

    redirect_to list_path, alert: "Item deleted." 
  end
  
  private
  def list_params
    params.require(:list).permit(:name, :category)
  end
end
