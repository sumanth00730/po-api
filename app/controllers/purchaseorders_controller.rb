class PurchaseordersController < ApplicationController
  def index
    @purchaseorder = PurchaseOrder.all
    render :json @purchaseorder
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
