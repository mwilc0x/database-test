require "../test_helper.rb"

# TODO: This won't work until we split the models into separate files and require them into test_helper.rb

class ProductTest < Test::Unit::TestCase
	def setup
		@product = Product.new
	end

	def test_is_a_product
		assert @product.is_a?(Product)
	end

	def test_has_price_field
		assert @product.respond_to?(:price)
	end
end
