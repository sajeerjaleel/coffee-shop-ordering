require 'unit/test_helper'
require 'calculators/offer_calculator'
require 'ostruct'

describe Calculators::OfferCalculator do
  let(:described_class) { Calculators::OfferCalculator }
  let(:item) { OpenStruct.new(id: '1', price: 10) }
  let(:offer_counts) { {'1': {item_ids: ['1','2'], count: 1}} }
  let(:offer_item) { MiniTest::Mock.new }

  describe :total_price do
    it 'provides total discounted price of an item' do
      offer_item.expect(:discount_rate, 10)
      result = described_class.new(mock_order_item, offer_counts, offer_class: mock_offer_class, offer_item_class: mock_offer_item_class).total_price
      result.must_equal(9)
    end
  end

  describe :total_discount do
    it 'provides total discount availed to an item' do
      offer_item.expect(:discount_rate, 10)
      result = described_class.new(mock_order_item, offer_counts, offer_class: mock_offer_class, offer_item_class: mock_offer_item_class).total_discount
      result.must_equal(1)
    end
  end

  describe :offers_applied do
    it 'provides name of offer' do
      offer_item.expect(:discount_rate, 10)
      result = described_class.new(mock_order_item, offer_counts, offer_class: mock_offer_class, offer_item_class: mock_offer_item_class).offers_applied
      result.must_equal("Burger Coke Combo")
    end
  end

  private

  def mock_order_item
    mock = MiniTest::Mock.new
    mock.expect(:item, item)
  end

  def mock_offer_class
    mock = MiniTest::Mock.new
    mock.expect(:where, mock, [{id: [:'1']}])
    mock.expect(:pluck, mock, [:name])
    mock.expect(:join, "Burger Coke Combo", [", "])
  end

  def mock_offer_item_class
    mock = MiniTest::Mock.new
    mock.expect(:where, mock, [{offer_id: :'1', item_id: '1'}])
    mock.expect(:first, offer_item)
  end
end