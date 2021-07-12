module Calculators
	##########################################################################
	# To calculate ooofer discounts and price of a particular item in an order
	##########################################################################
	class OfferCalculator
		attr_reader :offer_counts, :offer_class, :offer_item_class

		def initialize(order_item, offer_counts, offer_class: Offer, offer_item_class: OfferItem)
			@order_item = order_item
			@offer_counts = offer_counts
			@total_discount = 0
			@total_price = 0
			@offer_class = offer_class
			@offer_item_class = offer_item_class
			calculate_discounts_and_price
		end

		def total_discount
			@total_discount
		end

		def total_price
			@total_price
		end

		def offers_applied
			offer_class.where(id: offer_ids).pluck(:name).join(", ")
		end

		private

		def item
			@item ||= @order_item.item
		end

		def item_price
			@item_price ||= item.price
		end

		def offer_ids
			@offer_ids ||= offer_counts.select{ |id,count| count[:item_ids].include?(item.id) }.keys
		end

		def offer_item(offer_id)
			@offer_item ||= offer_item_class.where(offer_id: offer_id, item_id: item.id).first
		end

		def calculate_discounts_and_price
			offer_ids.each do |offer_id|
				discount_rate = offer_item(offer_id).discount_rate
				discount_quantity = offer_counts[offer_id][:count]
				@total_price += calculated_price(discount_rate, discount_quantity)
				@total_discount += calculate_discount(discount_rate, discount_quantity)
			end
		end

		def calculated_price(discount_rate, discount_quantity)
			discount_quantity * (item_price - (item_price * discount_rate / 100))
		end

		def calculate_discount(discount_rate, discount_quantity)
			discount_quantity * (item_price * discount_rate / 100)
		end
	end
end