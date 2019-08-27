# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViaCep, type: :service do

  context 'when was given a correct zipcode' do
    let(:address) { ViaCep.new('21931380') }
    it 'returns the street name' do
      VCR.use_cassette('via_cep_return') do
        expect(address.street_address).to eq('Rua Colina')
      end
    end

    it 'returns the city' do
      VCR.use_cassette('via_cep_return') do
        expect(address.city).to eq('Rio de Janeiro')
      end
    end

    it 'returns the state' do
      VCR.use_cassette('via_cep_return') do
        expect(address.state).to eq('RJ')
      end
    end
  end

  context 'when was given an incorrect zipcode' do
    it 'returns an error if is not a number' do
      expect { ViaCep.new('123a5678') }.to raise_error(WrongTypeOfArgumentError)
    end

    it 'returns an error if has less than 8 chars' do
      expect { ViaCep.new('123') }.to raise_error(WrongSizeOfArgumentError)
    end

    it 'returns an error if has more than 8 numbers' do
      expect { ViaCep.new('123456789') }.to raise_error(WrongSizeOfArgumentError)
    end
  end
end
