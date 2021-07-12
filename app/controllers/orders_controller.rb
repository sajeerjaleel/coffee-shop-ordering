class OrdersController < ApplicationController

	before_action :sanitize_params, :only => [:create]
	before_action :set_order, :only => [:show, :destroy, :complete]

	def new
		@categories = Category.all.includes(:items)
		@order = Order.new
		@order.order_items.build
	end

	def create
		@order = Order.new(order_params)
		@order.save
		Billing::BillingService.new(@order).create_bill
		redirect_to order_path(@order.id)
	end

	def show
		@order_items = @order.order_items.includes(:item)
	end

	def destroy
		@order.destroy
		redirect_to new_order_path
	end

	def complete
		@order.update_attributes(status: Order.statuses[:payment_completed])
	end

	private

	def order_params
        params.require(:order).permit(order_items_attributes: [:item_id, :quantity])
    end

    def sanitize_params
    	params[:order][:order_items_attributes].delete_if{ |k,v| v[:quantity].blank? }
    end

    def set_order
    	@order = Order.find_by_id(params[:id])
    end
end
