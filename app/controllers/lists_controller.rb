class ListsController < ApplicationController
  def index
  end
  def new
    @lists = List.new
  end
  def create
    @lists = List.new
    if @lists.save
      redirect_to root_path, alert: "Successfully Created"
    else
      render 'new'
    end
  end
end
