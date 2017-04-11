require 'test_helper'

class ChefTest < ActiveSupport::TestCase
	
	def setup
	@chef = Chef.new(chefname:"jose", email:"jajosemiguel@gmail.com")
	end

	test "Should ve balid" do
		assert @chef.valid?
	end

	test "name should be present" do
      @chef.chefname = " "
      assert_not @chef.valid?
	end

	test "name should be less than 30 characters" do
		@chef.chefname = "a" * 31
		assert_not @chef.valid?
	end
	test "email should not be too long" do
		@chef.email ="a" * 245 + "@gmail.com"
		assert_not @chef.valid?
	end
	test "email should accept be correct format" do
		valid_emails = %w[user@example.com jajosemiguel@gmail.com]
		valid_emails.each do |valids|
		@chef.email = valids
		assert @chef.valid?, "#{valids,inspect} should be valid"
	  end
	end
    test "should reject invalid addresses" do |
    	invalid_emails = %w[jajosemiguel@gmail.com, america8362@hotmail.com]
    	invalid_emails.each do |invalids|
    		@chef.email =invalids
    		assert_not @chef.valid?, "#{invalids.inspect}should be invalid"
        end
    end

    test "email should be unique" do
    	duplicate_chef = @chef.dup
    	duplicate_chef.email = @chef.email.upcase
    	@chef.save
    	assert_not duplicate_chef.valid?
    end

    test "email should be case insensitive" do
    	
    end
end

