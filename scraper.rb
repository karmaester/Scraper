require 'nokogiri'
require 'open-uri'
require 'byebug'

def scraper(url)
    doc = Nokogiri::HTML(URI.open(url))
    prices = []
    elements = doc.css('span.ui-search-search-result__quantity-results').text.to_i
    per_page = doc.css('li.ui-search-layout__item').count
    total_pages = (elements / per_page).round
    doc.css('li.ui-search-layout__item div.ui-search-price__second-line span.price-tag span.price-tag-fraction').each_with_index do |price, index|
      if index.even? && !price.nil? # since the not evens are the payment cuotes
        prices.push(price.text.delete('.').to_i)
      end
    end
    byebug
end

# scraper('https://listado.mercadolibre.cl/doctor-who')

scraper('https://listado.mercadolibre.cl/audifonos-sennheiser')