class PurchaseordersController < ApplicationController
  before_action :purchase_params, only: %i[ create ]

  def index
  end

  def show
  end

  def destroy
  end

  def update
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
      params.require(:purchase).permit(:po_number,:delivery_date,:date,:payment_terms,:amount,:cgst,:sgst,:igst,:tds,:description)
    end
end
