require 'active_record'

class Product < ActiveRecord::Base
	has_many :purchases
	belongs_to :store
        has_one :price
end
