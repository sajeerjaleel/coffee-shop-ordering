module Billing
	#######################################################################
	# To handle total price, discount, tax of a particular item in an order
	#######################################################################
	class InvoiceItemBilling
		attr_reader :order_item, :invoice, :item_counts, :offer_counts, :offer_calculator
		
		def initialize(order_item, item_counts, offer_counts)
			@order_item = order_item
			@invoice = order_item.order.invoice
			@item_counts = item_counts
			@offer_counts = offer_counts
			@offer_calculator = Calculators::OfferCalculator.new(order_item, offer_counts)
		end

		def create_invoice_item
			total_price = total_non_discounted_price + total_discounted_price
			total_tax = (total_price * tax_rate / 100)
			net_price = total_price + total_tax
			invoice.invoice_items.create(item_id: order_item.item_id, quantity: order_item.quantity, total_tax: total_tax, total_discount: total_discount, total_price: net_price, offers_applied: offers_applied)
		end

		private

		def item
			@item ||= order_item.item
		end

		def item_price
			@item_price ||= item.price
		end

		def tax_rate
			item.tax_rate
		end

		def non_discounted_quantity
			item_counts[item.id]
		end

		def total_non_discounted_price
			item_price * non_discounted_quantity
		end

		def total_discounted_price
	    offer_calculator.total_price
		end

		def total_discount
	    offer_calculator.total_discount
		end

		def offers_applied
			offer_calculator.offers_applied
		end

	end
end