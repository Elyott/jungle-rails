require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      @category = Category.new(name: "Gadget")
      @product = Product.new(name: "Cool Sunglasses", price: 16.99, quantity: 5, category: @category )
      expect(@product).to be_valid
    end
    it "is not valid without a name" do
      @category = Category.new(name: "Gadget")
      @product = Product.new(name: nil, price: 16.99, quantity: 5, category: @category )
      expect { raise @product }.to raise_error(StandardError)
    end
    it "is not valid without a price" do
      @category = Category.new(name: "Gadget")
      @product = Product.new(name: "Cool Sunglasses", price: nil, quantity: 5, category: @category )
      expect { raise @product }.to raise_error(StandardError)
    end
    it "is not valid without a quantity" do
      @category = Category.new(name: "Gadget")
      @product = Product.new(name: "Cool Sunglasses", price: 16.99, quantity: nil, category: @category )
      expect { raise @product }.to raise_error(StandardError)
    end
    it "is not valid without a category" do
      @category = Category.new(name: "Gadget")
      @product = Product.new(name: "Cool Sunglasses", price: 16.99, quantity: 5, category: nil )
      expect { raise @product }.to raise_error(StandardError)
    end
  end
end
