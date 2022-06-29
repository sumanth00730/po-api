
class Api::V1::PurchaseordersController < ApplicationController
  before_action :purchase_params, only: %i[ create update ]
  before_action :find_order, only: %i[ destroy update show]
  require 'open-uri'
  require 'rest-client'
  def index
    @purchases = PurchaseOrder.paginate(:page => params[:page], :per_page => 10)
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
    @file = PurchaseOrder.new(purchase_params)
  
      #       temp_file_path = params[:invoice].tempfile.path
      #       request = RestClient::Request.new(
      #           :method => :post,
      #           :url => 'https://8cec-183-82-114-140.in.ngrok.io',
      #           :payload => {
      #             :multipart => true,
      #             :file => File.new(temp_file_path,'rb')
      #           })      
      #       response = request.execute
      #       data = JSON.parse(response.body)
      #       @a = data[0]["Value"]
      #       @a = @a.strip
      #       puts @a
      # #render json: response
      #   response = RestClient.get 'https://1cd3-183-82-114-140.in.ngrok.io/api/v1/vendorinfos'
      #   @b = JSON.parse(response.body)
      #   render json: @b
      #   length = @b.size
      #   (length).times do |ind|
      #     @c = @b[ind]["vendor_company_name"].strip
      #     if @a == @c
      #       @file.vendor_id = @b[ind]['id']
      #       @file.save
      #     end
      #   end
      @file.save
  end

  private
    def purchase_params
      params.permit( :po_number,:owner_name,:vendor_name,:date, :expected_date, :amount, :status,:invoice)
    end
    def find_order
      @purchase = PurchaseOrder.find(params[:id])
    end
end
