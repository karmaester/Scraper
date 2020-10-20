require 'nokogiri'
require 'open-uri'
require 'byebug'

# class Scraper
  
# end

def scraper
  doc = Nokogiri::HTML(URI.open('https://listado.mercadolibre.cl/computacion/notebooks/'))
  prices = []
  elements = doc.css('span.ui-search-search-result__quantity-results').text.delete('.').to_i
  per_page = doc.css('li.ui-search-layout__item').count
  total_pages = (elements / per_page).round
  page = 1
  num = 1
  while page <= total_pages
    doc = Nokogiri::HTML(URI.open('https://listado.mercadolibre.cl/computacion/notebooks/' + '_Desde_'+ num.to_s))
    doc.css('li.ui-search-layout__item div.ui-search-price__second-line span.price-tag span.price-tag-fraction')
      .each_with_index do |price, index|
      if index.even? && !price.nil? # since the not evens are the payment cuotes
        prices.push(price.text.delete('.').to_i)
        puts price
        puts page
      end
    end
    page += 1
    num += 50
  end
  [total_pages, prices]
  byebug
end

scraper