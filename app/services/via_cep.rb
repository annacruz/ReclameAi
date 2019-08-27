# frozen_string_literal: true
class ViaCep

  def initialize(zipcode)
    raise WrongTypeOfArgumentError if zipcode.count('a-zA-Z').positive?
    raise WrongSizeOfArgumentError if zipcode.size != 8

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

class WrongTypeOfArgumentError < StandardError
  def initialize(msg = 'This is not the type that this function needs')
    super(msg)
  end
end

class WrongSizeOfArgumentError < StandardError
  def initialize(msg = 'Wrong size of zipcode. It must contains 8 chars')
    super(msg)
  end
end
