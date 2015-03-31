module Admin
  class CategoriesController < ApplicationController

    def edit
      @category = Category.find(params[:id])
    end

    def new
      @category = Category.new
    end

    def show
      binding.pry
      Category.find(params[:id])
    end
  end
end
