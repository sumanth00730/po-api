class PurchaseordersController < ApplicationController
  def index
    purchase_orders = PurchaseOrder.all
    render json: purchase_orders
  end

  def show
  end

  def destroy
    find_order
    if @purchase_order.destroy
      render json: {status: 'SUCCESS', message: 'Purchase order deleted', data: @purchase_order.id},status: :ok
    else
      render json: {status: 'ERROR', message: @purchase_order.errors},status: :unprocessable_entity
    end
  end

  def destroy_all
    if PurchaseOrder.delete_all
      render json: {status: 'SUCCESS', message: 'All purchase orders deleted'},status: :ok
    else
      render json: {status: 'ERROR'},status: :unprocessable_entity
    end
  end


  def update
  end

  def create
  end

  private
    def find_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end
end
