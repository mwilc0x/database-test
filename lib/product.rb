class Product < ActiveRecord::Base
	has_many :purchases
	belongs_to :store
end
