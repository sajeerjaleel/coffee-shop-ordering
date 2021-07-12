require 'unit/test_helper'
require 'billing/order_billing'

describe Billing::OrderBilling do
  let(:described_class) { Billing::OrderBilling }
  let(:total_discount) { MiniTest::Mock.new }
  let(:total_tax) { MiniTest::Mock.new }
  let(:total_price) { MiniTest::Mock.new }

  describe :update_bill do
    it 'updates the order record with appropriate values' do
      result = described_class.new(mock_order).update_bill
      result.must_equal(:updated)
    end

    private

    def mock_order
      mock = MiniTest::Mock.new
      3.times{ mock.expect(:order_items, mock) }
      mock.expect(:sum, total_discount, [:total_discount])
      mock.expect(:sum, total_tax, [:total_tax])
      mock.expect(:sum, total_price, [:total_price])
      mock.expect(:update_attributes, :updated, [total_discount: total_discount, total_tax: total_tax, total_amount: total_price])
    end
  end
end