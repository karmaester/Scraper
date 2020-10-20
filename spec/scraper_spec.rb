require_relative '../lib/scraper_methods.rb'

describe Scraper do
    let(:program) { Scraper.new }
    describe '#scraper' do
        it 'returns an array' do
            expect(program.scraper).to be_an_instance_of(Array)
        end
    end
end