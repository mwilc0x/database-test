require "../test_helper.rb"

class PurchaseTest < Test::Unit::TestCase
 def setup
  @purchase = Purchase.new
 end

 def test_is_a_purchase
  assert @purchase.is_a?(Purchase)
 end

 def test_has_product_id
  assert @purchase.respond_to?(:product_id)
 end

 def test_has_store_id
  assert @purchase.respond_to?(:store_id)
 end

 def test_has_product_field
  assert @purchase.respond_to?(:product)
 end
end
