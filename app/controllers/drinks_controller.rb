class DrinksController < ApplicationController
  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:notice] = 'Drink added.'
      redirect_to '/drinks'
    else
      render :new
    end
  end

  def index
    if params[:category_id]
      category = Category.find(params[:category_id].to_i)
      @drinks = Drink.page(params[:page])
    else
      @drinks = Drink.page(params[:page])
    end
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description, :alcohol_level, :featured, :category_id)
  end
end
