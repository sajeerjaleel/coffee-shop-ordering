#######################################################################
# To handle total price, discount, tax of a particular item in an order
#######################################################################
class ItemBilling
	attr_reader :item_counts, :offer_counts, :offer_calculator
	
	def initialize(order_item, item_counts, offer_counts)
		@order_item = order_item
		@item_counts = item_counts
		@offer_counts = offer_counts
		@offer_calculator = OfferCalculator.new(order_item, offer_counts)
	end

	def update_bill
		total_price = total_non_discounted_price + total_discounted_price
		total_tax = (total_price * tax_rate / 100)
		net_price = total_price + total_tax
		@order_item.update_attributes(total_tax: total_tax, total_discount: total_discount, total_price: net_price, offers_applied: offers_applied)
	end

	private

	def item
		@item ||= @order_item.item
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
