class PurchaseordersController < ApplicationController
  def index
    @purchases = PurchaseOrder.all
    render json: @purchases
  end

  def show
  end

  def destroy
  end

  def update
  end

  def create
  end
end
