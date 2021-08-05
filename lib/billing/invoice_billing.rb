module Billing
	#######################################################################
	# To calculate total bill of an order from each order items
	#######################################################################
	class InvoiceBilling
		
		def initialize(invoice)
			@invoice = invoice
		end

		def update_bill
			@invoice.update_attributes(total_discount: total_discount, total_tax: total_tax, total_amount: total_amount)
		end

		private

		def total_discount
			@invoice.invoice_items.sum(:total_discount)
		end

		def total_tax
			@invoice.invoice_items.sum(:total_tax)
		end

		def total_amount
			@invoice.invoice_items.sum(:total_price)
		end
	end
end