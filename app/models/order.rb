class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	has_many :items, :through => :order_items
	has_one :invoice

	accepts_nested_attributes_for :order_items, allow_destroy: true, reject_if: :all_blank

	enum status: [:pending, :payment_completed, :delivered]

	after_save :create_invoice

	private

	def create_invoice
		Invoice.create(order_id: self.id, time: Time.now)
	end
end
