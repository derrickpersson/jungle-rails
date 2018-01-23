require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      @category = Category.create!(name: 'test')
      @product1 = Product.create!(name: 'a', quantity: 3, description: "a", price_cents: 10, category: @category)
      @product2 = Product.create!(name: 'b', quantity: 2, description: "a", price_cents: 10, category: @category)
    end

    it 'deducts quantity from products based on their line item quantities' do
      # @order = Order.new(email: 'test@test.com', stripe_charge_id: "test", total_cents: 20)

      # @lineItem1 = LineItem.new(order_id: @order, product_id: @product1, quantity: 1, item_price_cents: 10, total_price_cents: 10)
      # @lineItem2 = LineItem.new(order_id: @order, product_id: @product2, quantity: 1, item_price_cents: 10, total_price_cents: 10)


      # @order.save!

      @order = Order.new

      @order.create_order("test")

      @product1.reload
      @product2.reload

      expect(@product1.quantity).to equal(2)
      expect(@product2.quantity).to equal(1)

    end

    it 'does not deduct quantity from products that are not in the order' do
    end
  end
end
