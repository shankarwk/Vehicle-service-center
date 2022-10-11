class CategoryListController < ApplicationController
  def index
    authorize! :read, CategoryList
    @all = CategoryList.all
  end

  def create
    authorize! :create, CategoryList
    @admin = CategoryList.new(category_params)
    @admin.save
  end

  def update
    authorize! :read, CategoryList
  end

  def show
    authorize! :read, CategoryList
    @show = CategoryList.find(params[:id])
  end

  def new
    authorize! :read, CategoryList
    @admin = CategoryList.new 
  end

  def edit
    authorize! :read, CategoryList
    @list = CategoryList.find(params[:id])
  end

  def destroy
    authorize! :read, CategoryList
    @d=CategoryList.find(params[:id])
    @d.destroy
  end

  private
  def category_params
    params.require(:category_list).permit(:name,:cost,:time)
  end   
end
