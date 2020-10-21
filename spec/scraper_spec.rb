require 'nokogiri'
require 'open-uri'
require_relative '../lib/scraper_methods'

describe Scraper do
  let(:program) { Scraper.new }
  let(:url) { 'https://listado.mercadolibre.cl/doctor-who' }
  let(:doc) { Nokogiri::HTML(URI.open(url)) }

  describe '#get_prices' do
    it 'Does not return an object' do
      expect(program.get_prices(url)).not_to be_an_instance_of(Object)
    end

    it 'Returns an array' do
      expect(program.get_prices(url)).to be_an_instance_of(Array)
    end
  end

  describe '#pages_num' do
    it 'Returns an integer' do
      expect(program.send(:pages_num, doc)).to be_an_instance_of(Integer)
    end

    it 'Does not return an object' do
      expect(program.send(:pages_num, doc)).not_to be_an_instance_of(Object)
    end
  end

  describe '#scraper' do
    it 'Returns a nokogiri document' do
      expect(program.send(:scraper, url)).to be_an_instance_of(Nokogiri::HTML::Document)
    end

    it 'Does not return an array' do
      expect(program.send(:scraper, url)).not_to be_an_instance_of(Array)
    end
  end
end
