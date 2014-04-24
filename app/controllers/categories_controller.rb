class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def new
    @categories = Category.new
  end
  def show
    redirect_to root_path
  end
  def create

    @categories = Category.new
    if @categories.save
      redirect_to root_path, alert: "Successfully created category."
    else
      render 'new'
    end
  end
  

end
