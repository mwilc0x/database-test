require "../test_helper.rb"

class EmployeesTest < Test::Unit::TestCase
        def setup
                @employees = Employees.new
        end

        def test_is_an_employee
                assert @employees.is_a?(Employees)
        end

        def test_has_name
                assert @employees.respond_to?(:name)
        end

        def test_has_ssn_field
                assert @employees.respond_to?(:ssn)
        end
         
        def test_has_an_address_field
                assert @employees.respond_to?(:address)
        end

        def test_has_a_store_id_field
               assert @employees.respond_to?(:store_id)
        end
end

