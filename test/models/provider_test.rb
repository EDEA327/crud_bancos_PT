require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  def setup
    @bank_attributes = { name: 'Banco de Prueba' }
    @provider_attributes = {
      name: 'Proveedor de Prueba',
      nit: '123456789-0',
      contact_name: 'Contacto de Prueba',
      contact_phone: '1234567890',
      bank_attributes: @bank_attributes
    }
  end

  test 'debería ser válido' do
    @provider = Provider.new(@provider_attributes)
    assert @provider.valid?
  end

  test 'name debería estar presente' do
    @provider_attributes[:name] = ''
    @provider = Provider.new(@provider_attributes)
    assert_not @provider.valid?
  end

  test 'nit debería tener un formato válido' do
    @provider_attributes[:nit] = 'formato_invalido'
    @provider = Provider.new(@provider_attributes)
    assert_not @provider.valid?
  end

  test 'contact name debería estar presente' do
    @provider_attributes[:contact_name] = ''
    @provider = Provider.new(@provider_attributes)
    assert_not @provider.valid?
  end

  test 'contact phone no debería exceder la longitud máxima' do
    @provider_attributes[:contact_phone] = '12345678901'
    @provider = Provider.new(@provider_attributes)
    assert_not @provider.valid?
  end
end
