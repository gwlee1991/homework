require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) {Dessert.new('cake', 5, chef)}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type"
      expect(dessert.type).to eq('cake')
    it "sets a quantity"
      expect(dessert.quantity).to eq(5)
    it "starts ingredients as an empty array"
      expect(dessert.ingredients).to eq([])
    it "raises an argument error when given a non-integer quantity"
      expect{ Dessert.new('cake', 'many', chef) }.to raise_error(ArgumentError)
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
      dessert.add_ingredient('flour')
      expect(dessert.ingredients).to include('flour')
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
      ingredients = ['milk', 'butter', 'sugar']
      ingredients.each do |ingredient|
        dessert.add_ingredient(ingredient)
      end

      dessert.mix!
      expect(dessert.ingredients).not to_eq(ingredients)
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"
      dessert.eat(1)
      expect(dessert.quantity).to eq(4)

    it "raises an error if the amount is greater than the quantity"
      expect { dessert.eat(10) }.to raise_error(ArgumentError)
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
      allow(chef).to receive(:titleize).and_return("Chef Chef the Great Baker")
      expect(dessert.serve).to eq("Chef Chef the Great Baker has made 5 cakes")
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
  end
end
