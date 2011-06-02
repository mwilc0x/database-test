require 'rubygems'

# Setup Bundler and make sure we're getting our gems from it
require 'bundler/setup'

require 'active_record'
require 'scruffy'

# Begin ActiveRecord configuration
ActiveRecord::Base.establish_connection(
  :adapter => "mysql2",
  :host => "localhost",
  :database => "paper",
  :username => "root",
  :password => "toor"
)

# Begin ActiveRecord classes
class Product < ActiveRecord::Base
  has_many :purchases
  belongs_to :store
end

class Purchase < ActiveRecord::Base
  belongs_to :product
end

class Store < ActiveRecord::Base
  has_many :products
  has_many :purchases, :through => :products
end

#Begin logic
myproducts = Product.all

file = File.open( "data.txt" )
file_lines = file.read.split("\n")
puts file_lines
file_lines.each do |line|
  if line.index(':') != -1
    if line[0, line.index(':')].eql?("stores")
      line = line[line.index(':')+2, line.length]
      a = line.split(", ")
      a.each do |city|
        Store.create(:location => city)
      end
    else
      line = line[line.index(':')+2, line.length]
      b = line.split(", ")
      b.each do |product|
        Product.create(:name => product)
      end
    end
  end
end

graph = Scruffy::Graph.new
graph.title = "Visual Representation of the Data"

stores = Store.select('id, location').all

myproducts.each do |product|
  counts = stores.collect do |store|
    Purchase.count("id", :conditions => {
                                :store_id=>store.id,
                                :product_id=>product.id
                               })
  end

  graph.add :line, product.name, counts
end

graph.point_markers = stores.map {|store| store.location}
graph.render :as => 'PNG', :to => 'productsales.png',
        :width => 1080,
        :height => 400,
        :theme => Scruffy::Themes::Keynote.new
