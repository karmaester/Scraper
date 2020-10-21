require 'nokogiri'
require 'open-uri'

class Scraper
  def initialize; end

  def get_prices(url)
    doc = scraper(url)
    total_pages = pages_num(doc)
    prices = []
    page = 1
    num = 1
    while page <= total_pages && page <= 40
      doc = Nokogiri::HTML(URI.open("#{url}_Desde_#{num}"))
      doc.css('li.ui-search-layout__item div.ui-search-price__second-line span.price-tag span.price-tag-fraction')
        .each_with_index do |price, index|
        index.even? && !price.nil? ? prices.push(price.text.delete('.').to_i) : next
      end
      page += 1
      num += 50
    end
    prices
  end

  private

  def pages_num(doc)
    elements = doc.css('span.ui-search-search-result__quantity-results').text.delete('.').to_i
    per_page = doc.css('li.ui-search-layout__item').count
    (elements / per_page)
  end

  def scraper(url)
    Nokogiri::HTML(URI.open(url))
  end

end
