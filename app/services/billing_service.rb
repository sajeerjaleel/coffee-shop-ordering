module Services
	##########################################################
    # To handle billing of an order
  ##########################################################
	class BillingService
		attr_reader :order

		def initialize(order)
			@order = order
		end

		def create_bill
			item_count_hash, offer_count_hash = Calculators::OfferItemsList.new(order).get_item_and_offer_counts

			order.order_items.each do |order_item|
				Billing::InvoiceItemBilling.new(order_item, item_count_hash, offer_count_hash).create_invoice_item
			end
			Billing::InvoiceBilling.new(order.invoice).update_bill
		end

  end

end