# frozen_string_literal: true
class ViaCep
  def initialize(zipcode)
    @address = get_address_data(zipcode)
  end

  def street_address
    @address['logradouro']
  end

  def city
    @address['localidade']
  end

  def state
    @address['uf']
  end

  private

  def get_address_data(zipcode)
    @address = HTTParty.get("http://viacep.com.br/ws/#{zipcode}/json/")
  end
end
