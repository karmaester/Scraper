# rubocop:disable Metrics/MethodLength, Lint/Void, Style/IfUnlessModifier
require 'nokogiri'
require 'open-uri'
require 'byebug'

class Scraper
  def initialize; end

  def scraper(url)
    doc = Nokogiri::HTML(URI.open(url))
    prices = []
    elements = doc.css('span.ui-search-search-result__quantity-results').text.delete('.').to_i
    per_page = doc.css('li.ui-search-layout__item').count
    total_pages = (elements / per_page)
    page = 1
    num = 1
    while page <= total_pages
      doc = Nokogiri::HTML(URI.open(url + '_Desde_' + num.to_s))
      doc.css('li.ui-search-layout__item div.ui-search-price__second-line span.price-tag span.price-tag-fraction')
        .each_with_index do |price, index|
        if index.even? && !price.nil? # since the not evens are the payment cuotes
          prices.push(price.text.delete('.').to_i)
        end
      end
      puts 'Cheking page ' + page.to_s
      page += 1
      url
      num += 50
    end
    prices
  end
end

# rubocop:enable Metrics/MethodLength, Lint/Void, Style/IfUnlessModifier
