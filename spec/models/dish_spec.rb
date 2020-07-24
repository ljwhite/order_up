require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    it "#total_calories" do
      @chef = Chef.create!(name: "Chef")
      @dish1 = Dish.create!(name: "Lasagna", description: "Just like how your Italian Grandma made it!", chef_id: @chef.id)
      @ingredient1 = Ingredient.create!(name: "Cheese", calories: 100)
      @ingredient2 = Ingredient.create!(name: "Ground Beef", calories: 120)
      @ingredient3 = Ingredient.create!(name: "Pasta", calories: 80)

      @dish1.dish_ingredients.create(ingredient: @ingredient1)
      @dish1.dish_ingredients.create(ingredient: @ingredient2)
      @dish1.dish_ingredients.create(ingredient: @ingredient3)

      expect(@dish1.total_calories).to eq(300)
    end
  end
end
