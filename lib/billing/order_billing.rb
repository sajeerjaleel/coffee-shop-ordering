module Billing
	#######################################################################
	# To calculate total bill of an order from each order items
	#######################################################################
	class OrderBilling
		
		def initialize(order)
			@order = order
		end

		def update_bill
			@order.update_attributes(total_discount: total_discount, total_tax: total_tax, total_amount: total_amount)
		end

		private

		def total_discount
			@order.order_items.sum(:total_discount)
		end

		def total_tax
			@order.order_items.sum(:total_tax)
		end

		def total_amount
			@order.order_items.sum(:total_price)
		end
	end
end