require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves successfully' do
      category = Category.new(name: 'Test')
      product = Product.new(name: 'a', price: 1, quantity: 1, category: category)
      expect(product).to be_valid
    end

    it "doesn't save when there is no name" do
      category = Category.new(name: 'Test')
      product = Product.create(price: 1, quantity: 1, category: category)
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "doesn't save when there is no price" do
      category = Category.new(name: 'Test')
      product = Product.create(name: 'a', quantity: 1, category: category)
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "doesn't save when there is no quantity" do
      category = Category.new(name: 'Test')
      product = Product.create(name: 'a', price: 1, category: category)
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "doesn't save when there is no category" do
      category = Category.new(name: 'Test')
      product = Product.create(name: 'a', quantity: 1, price: 1)
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
