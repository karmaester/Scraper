require 'nokogiri'
require 'open-uri'
require 'byebug'

def scraper(url)
    doc = Nokogiri::HTML(URI.open(url))

    doc.css('li.ui-search-layout__item span.price-tag span.price-tag-fraction').each do |price|
        puts price.text
      end
    byebug
end

# scraper('https://listado.mercadolibre.cl/doctor-who')

scraper('https://listado.mercadolibre.cl/audifonos-sennheiser')
