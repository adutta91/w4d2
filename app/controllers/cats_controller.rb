class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :show
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render :cat
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      # @cats = Cat.all
      # render :show
      redirect_to cats_url
    else
      render :new
    end
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  def new
    @cat = Cat.new
    render :new
  end

  private

  def cat_params
    params.require(:cat).
      permit(
        :name, :birth_date, :sex,
        :color, :description
      )
  end
end
