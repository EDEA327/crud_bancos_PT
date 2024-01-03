require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  test 'nombre no debe exceder los 255 caracteres' do
    provider = providers(:one)
    provider.name = 'a' * 256

    assert_not provider.valid?, 'Se esperaba que el proveedor no fuera válido con un nombre demasiado largo'
    assert_includes provider.errors[:name], I18n.t('activerecord.errors.models.provider.attributes.name.too_long', count: 255)
  end

  test 'NIT debe tener formato válido' do
    provider = providers(:one)
    provider.nit = '1234'

    assert_not provider.valid?, 'Se esperaba que el proveedor no fuera válido con un NIT inválido'
    assert_includes provider.errors[:nit], I18n.t('activerecord.errors.models.provider.attributes.nit.invalid')
  end
end
