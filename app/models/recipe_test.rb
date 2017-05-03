require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
	
	def setup

		@chef = Chef.create!(chefname: "Jose", email: "jajosemiguel@gmail.com",
			     password: "password", password_confirmation: "password")
		@recipe = @chef.recipes.build(name: "vegetable",description:"great vegetable recipe", chef_id: @chef.id)
	
	end
	test "recipe without chef should be invalid" do
      @recipe.chef_id = nil
      asser_not @recipe.valid?
	end

    test "recipe should be valid" do
    assert @recipe.valid?
     end
 
  test "name should be present " do
  @recipe.name = " "
  asser_not @recipe.valid?
 end

  test "description should be present " do
  @recipe.description = " "
  asser_not @recipe.valid?
 end
 test "description shouldn't be less than 5 characters" do
 @recipe.description = "a" * 3 
 asser_not @recipe.valid?
 end
test "description shouldn't be more than 500 characters" do
@recipe.description = "a" * 501
asser_not @recipe.valid?

end
test " email should be present" do
	@chef.email = " "
	asser_not @chef.valid?
	@chef.save
	asser_not duplicate_chef.valid?
end
test "email should be lower case before hitting db" do
	mixed_email = "jajosemiguel@gmail.com"
	@chef.email = mixed_email
	@chef.save
	assert_equal mixed_email.downcase, @chef.reload.email
  end
end
