require 'nokogiri'
require 'open-uri'
require 'byebug'

def scraper
    # doc = Nokogiri::HTML(URI.open('https://listado.mercadolibre.cl/audifonos-sennheiser'))
    doc = Nokogiri::HTML(URI.open('https://listado.mercadolibre.cl/doctor-who'))

    items = doc.css('li.ui-search-layout__item')
    prices = doc.css('span.price-tag')
    prices.css('span.price-tag-fraction').each do |price|
        puts price.text
      end
    byebug
end

scraper