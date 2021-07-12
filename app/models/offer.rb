class Offer < ApplicationRecord
	has_many :offer_items, dependent: :destroy
	has_many :items, :through => :offer_items

	scope :active, ->{where('active = true AND end_date > :now', now: Time.now)}
end
