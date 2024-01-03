# test/controllers/providers_controller_test.rb

require 'test_helper'

class ProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provider = providers(:one)
  end

  test 'debería obtener el índice' do
    get providers_url
    assert_response :success
  end

  test 'debería obtener nuevo' do
    get new_provider_url
    assert_response :success
  end

  test 'debería crear proveedor' do
    assert_difference('Provider.count') do
      post providers_url, params: { provider: { name: 'Nuevo Proveedor', nit: '123456789-0', contact_name: 'Nuevo Contacto', contact_phone: '1234567890', bank_id: banks(:one).id } }
    end

    assert_redirected_to provider_url(Provider.last)
    assert_equal I18n.t('providers.create.success'), flash[:notice]
  end

  test 'debería mostrar proveedor' do
    get provider_url(@provider)
    assert_response :success
  end

  test 'debería obtener editar' do
    get edit_provider_url(@provider)
    assert_response :success
  end

  test 'debería actualizar proveedor' do
    patch provider_url(@provider), params: { provider: { name: 'Proveedor Actualizado' } }
    assert_redirected_to provider_url(@provider)
    assert_equal I18n.t('providers.update.success'), flash[:notice]
  end

  test 'debería destruir proveedor' do
    assert_difference('Provider.count', -1) do
      delete provider_url(@provider)
    end

    assert_redirected_to providers_url
    assert_equal I18n.t('providers.destroy.success'), flash[:notice]
  end
end
