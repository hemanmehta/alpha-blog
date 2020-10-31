require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    #Write test case
    #test "english statement" do
    #   create instance variable
    #   user assertions for validation
    # end
    test "category should be valid" do
        @category = Category.new(name: "Sports")
        assert @category.valid?
    end
end