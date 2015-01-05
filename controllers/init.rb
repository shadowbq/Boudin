# encoding: utf-8
## Locate & Load the Controllers

Dir.foreach("#{Dir.pwd}/controllers") do |item|
  next if item == '.' or item == '..' or item == 'init.rb'
  require_relative item
end