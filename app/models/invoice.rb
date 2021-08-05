class Invoice < ApplicationRecord
	has_many :invoice_items, dependent: :destroy
	has_many :items, :through => :invoice_items

	enum status: [:pending, :payment_completed]
end
