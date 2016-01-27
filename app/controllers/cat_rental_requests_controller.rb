class CatRentalRequestsController < ApplicationController
  def index
    @rental_requests = CatRentalRequest.all
    render :show
  end

  def new
    @request = CatRentalRequest.new
    render :new
  end

  def create
    @request = CatRentalRequest.new(rental_params)
    if @request.save
      redirect_to cat_url(@request.cat)
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:cat_rental_requests).permit(
      :start_date, :end_date, :cat_id, :status
    )
  end
end
