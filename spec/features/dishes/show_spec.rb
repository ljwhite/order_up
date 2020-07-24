require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit a dish show page" do
    before :each do
      @chef = Chef.create!(name: "Chef")
      @dish1 = Dish.create!(name: "Lasagna", description: "Just like how your Italian Grandma made it!", chef_id: @chef.id)
      @ingredient1 = Ingredient.create!(name: "Cheese", calories: 100)
      @ingredient2 = Ingredient.create!(name: "Ground Beef", calories: 120)
      @ingredient3 = Ingredient.create!(name: "Pasta", calories: 80)

      @dish1.dish_ingredients.create(ingredient: @ingredient1)
      @dish1.dish_ingredients.create(ingredient: @ingredient2)
      @dish1.dish_ingredients.create(ingredient: @ingredient3)

    end
    it "I see the list of ingredients and the chef who makes it" do

      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content(@chef.name)
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
      expect(page).to have_content(@ingredient3.name)

    end
  end
end
