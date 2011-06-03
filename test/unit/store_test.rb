require "../test_helper.rb"

class StoreTest < Test::Unit::TestCase
        def setup
                @store = Store.new
        end

        def test_is_a_store
                assert @store.is_a?(Store)
        end

        def test_has_location_field
                assert @store.respond_to?(:location)
        end
end

