require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(URI.open('https://listado.mercadolibre.cl/audifonos-sennheiser'))

puts doc.xpath("//span")

doc.css('price-tag-fraction').each do |link|
  puts link.content
end