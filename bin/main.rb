require_relative '../lib/scraper_methods'

program = Scraper.new
puts 'Input a search for an item in mercadolibre you want the prices for'
input = gets.chomp.strip.downcase
puts 'Hold tight, this could take a while...'
prices = program.get_prices("https://listado.mercadolibre.cl/#{input}")

print 'Highest price for this item is: '
puts prices.max
print 'Lowest price for this item is: '
puts prices.min
print 'Number of prices checked: '
puts prices.count
