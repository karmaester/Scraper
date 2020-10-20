require_relative '../lib/scraper_methods.rb'

describe Scraper do
    let(:program) { Scraper.new }
    let(:url) { 'https://listado.mercadolibre.cl/doctor-who' }
    describe '#scraper' do
        it 'returns an array' do
            expect(program.scraper(url)).to be_an_instance_of(Array)
        end
    end
end