require_relative '../lib/scraper_methods.rb'

program = Scraper.new
puts 'Input a search for an item in mercadolibre you want the prices for'
input = gets.chomp
prices = program.scraper('https://listado.mercadolibre.cl/' + input)

puts 'Prices for this item are:'
puts prices

