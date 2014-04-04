class ListsController < ApplicationController
  def index
    @lists = List.all
  end
  def new
    @lists = List.new
  end
  def create
    @lists = List.new(list_params)
    if @lists.save
      redirect_to root_path, alert: "Successfully Created"
    else
      render 'new'
    end
  end
  def destroy
    @lists = List.find(params[:id])
    @lists.destroy

    redirect_to root_path
  end
  
  private
  def list_params
    params.require(:list).permit(:name)
  end
end
