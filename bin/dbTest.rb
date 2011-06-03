require File.join(File.dirname(__FILE__), '..', 'lib', 'product')
require File.join(File.dirname(__FILE__), '..', 'lib', 'purchase')
require File.join(File.dirname(__FILE__), '..', 'lib', 'store')
require 'rubygems'
require 'yaml'
require 'bundler/setup'
require 'active_record'
require 'scruffy'

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

db_config = YAML.load_file(File.join(File.dirname(__FILE__), 'database.yml'))
ActiveRecord::Base.establish_connection(db_config)

%w(store product purchase).each {|lib| require lib }

#Begin logic
myproducts = Product.all

def loadData
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
end

def createGraph
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
end
