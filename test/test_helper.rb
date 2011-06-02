# = Test::Unit Helper Script
#
# This file handles the setup of Test::Unit and should contain code that
# all tests share in common (i.e. connecting to the database and requiring the models to be tested).
#
# It can also contain modules with macro methods to handle repetitive tasks.
# Right now all it does is require the unit testing library.
#
# See http://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing for an intro
# to unit testing.

require 'test/unit'


# MAGIC: This tweaks the load path so that we can just require individual 
# models w/o path info. The global variable $: represents the load path, 
# kind of like Java's CLASSPATH. We're "unshifting" a new path onto the 
# array (prepending it to the beginning).
# 
lib_dir = File.join(File.dirname(__FILE__), '..', 'lib')
$:.unshift(lib_dir)

# TODO: Separate Store model into its own file and require it here. Ditto for other models.
#
# i.e.: require 'product'
# or iterate thru an array of models: %w(store product purchase).each {|lib| require lib }
