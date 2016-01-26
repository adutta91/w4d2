class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :show
  end


  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      # @cats = Cat.all
      # render :show
      index
    else
      redirect_to new_cat_url
    end
  end


  def new
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
