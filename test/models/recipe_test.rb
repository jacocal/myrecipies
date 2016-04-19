require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com") #must be create to hit the data base and not just in-memory
    #@recipe = Recipe.new(name: "chicken", summary: "best chicken ever", 
    #          description: "Add it all, squash it and finally fry it") #@ makes it an instance variable instead of a local variable
    @recipe = @chef.recipes.build(name: "chicken", summary: "best chicken ever", 
              description: "Add it all, squash it and finally fry it") #with added variable and reference
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "name should be valid" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name length too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name length too short" do
    @recipe.name = "a" * 4
    assert_not @recipe.valid?
  end
  
  test "summary must be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "summary length too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "summary length too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "description must be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "description length too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
  test "description length too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
  
end