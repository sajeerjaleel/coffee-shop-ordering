module Calculators
	#######################################################################
	# To get hash of total items count and offer counts of an order
	#######################################################################
	class OfferItemsList
		attr_reader :order

		def initialize(order)
			@order = order
			@item_count_hash = {}
			@offer_count_hash = {}
		end

		def get_item_and_offer_counts		
			set_item_count_hash
			set_offer_count_hash
			get_valid_offers_count
			sanitize_hashes
			return @item_count_hash,@offer_count_hash
		end

		private

		def active_offers
			Offer.active.order(:priority_order)
		end

		def set_item_count_hash
			@order.order_items.each do |order_item|
				@item_count_hash[order_item.item_id] = order_item.quantity
			end
		end

		def set_offer_count_hash
			active_offers.each do |offer|
			 	@offer_count_hash[offer.id] = {item_ids: offer.offer_items.pluck(:item_id), count: 0}
			end
		end

		def get_valid_offers_count
			@offer_count_hash.each do |offer_id, value|
				@offer_count_hash[offer_id][:count] = value[:item_ids].map {|id| @item_count_hash[id] || 0 }.min
				@offer_count_hash[offer_id][:item_ids].each do |item_id|
					@item_count_hash[item_id] = (@item_count_hash[item_id] - @offer_count_hash[offer_id][:count]) if @item_count_hash[item_id]
				end
			end
		end

		def sanitize_hashes
			@offer_count_hash.delete_if{ |offer_id,id_count_hash| id_count_hash[:count] == 0 }
		end
	end
end