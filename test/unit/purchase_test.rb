require "../test_helper.rb"

# TODO: This won't work until we split the models into separate files and require them into test_helper.rb

class PurchaseTest < Test::Unit::TestCase
 def setup
  @purchase = Purchase.new
 end

 def test_is_a_purchase
  assert @purchase.is_a?(Purchase)
 end

 def test_has_product_field
  assert @purchase.respond_to?(:product)
 end
end