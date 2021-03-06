require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be valid if name, price, quantity and category are present' do
      category = Category.new(name: 'apparel')
      product = Product.new(name: 'a', price_cents: 3400, quantity: 40,category: category)
      expect(product).to be_valid
    end

    it 'should be invalid if name is not present' do
      product = Product.new
      expect(product).to_not be_valid
    end

    it 'should be invalid if price is not present' do
      product = Product.new
      expect(product).to_not be_valid
    end

    it 'should be invalid if quantity is not present' do
      product = Product.new
      expect(product).to_not be_valid
    end

    it 'should be invalid if category is not present' do
      product = Product.new
      expect(product).to_not be_valid
    end

  end

end

