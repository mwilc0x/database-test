require 'active_record'

class Purchase < ActiveRecord::Base
	belongs_to :product
end
