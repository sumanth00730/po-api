class Api::V1::PurchaseordersController < ApplicationController
  before_action :purchase_params, only: %i[ create update ]
  before_action :find_order, only: %i[ destroy update show]

  def index
    @purchases = PurchaseOrder.all
    render json: @purchases
  end

  def show
    render json: {status: 'SUCCESS', message: 'Successfully fetched vendor', data: @purchase},status: :ok
  end

  def destroy
    find_order
    if @purchase.destroy
      render json: {
            description: "Successfully deleted Purchase order details"
          }, status: :ok
      else
        render json: {
          description: " Error in deleting Purchase order details"
        }, status: :unprocessable_entity
      end
  end

  def update
    if @purchase.update(purchase_params)
      render json: @purchase
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  def create
    @purchases = PurchaseOrder.new(purchase_params)
    if @purchases.save
      render json: @purchases, status: :created
    else
      render json: @purchases.errors, status: :unprocessable_entity
    end
  end

  private
    def purchase_params
      params.require(:purchaseorder).permit(:po_number,:delivery_date,:date,:payment_terms,:amount,:cgst,:sgst,:igst,:tds,:description)
    end
    def find_order
      @purchase = PurchaseOrder.find(params[:id])
    end
end
