require '../scraper.rb'

describe '#scraper' do
    it 'returns an array' do
        expect(scraper('https://listado.mercadolibre.cl/doctor-who')).to eql(Object)
    end
end