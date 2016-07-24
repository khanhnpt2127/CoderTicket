require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it "checks for presence of name" do
      category = Category.new(name: 'Hello World')
      category.save
      expect(category.errors.full_messages).to include('Name is not included in the list')
    end
  end
    it "should validate uniqueness of name "do
      category1= Category.new(name: 'Hello12')
      category1.save
      category2 = Category.create(name: 'Hello12')
      category2.should_not be_valid, "category2 was not valid #{category2.errors.inspect} "
      category2.errors[:name].should include ("has already been taken")
      
    end
  end

