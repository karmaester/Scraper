require_relative '../lib/scraper_methods'

program = Scraper.new
puts 'Input a search for an item in mercadolibre you want the prices for'
input = gets.chomp.strip.downcase
prices = program.get_prices("https://listado.mercadolibre.cl/#{input}")

puts 'Prices for this item are:'
print prices
