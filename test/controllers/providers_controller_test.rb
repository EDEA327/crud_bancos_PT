require 'test_helper'

class ProveedoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proveedor = providers(:one)
  end

  test 'debería obtener el índice' do
    get proveedores_url
    assert_response :success
  end

  test 'debería obtener nuevo' do
    get new_proveedor_url
    assert_response :success
  end

  test 'debería crear proveedor' do
    assert_difference('Provider.count') do
      post proveedores_url, params: { provider: { name: 'Nuevo Proveedor', nit: '123456789-0', contact_name: 'Nuevo Contacto', contact_phone: '1234567890', bank_id: banks(:one).id } }
    end

    assert_redirected_to proveedor_url(Provider.last)
    assert_equal I18n.t('providers.create.success'), flash[:notice]
  end

  test 'debería mostrar proveedor' do
    get proveedor_url(@proveedor)
    assert_response :success
  end

  test 'debería obtener editar' do
    get edit_proveedor_url(@proveedor)
    assert_response :success
  end

  test 'debería actualizar proveedor' do
    patch proveedor_url(@proveedor), params: { provider: { name: 'Proveedor Actualizado' } }
    assert_redirected_to proveedor_url(@proveedor)
    assert_equal I18n.t('providers.update.success'), flash[:notice]
  end

  test 'debería destruir proveedor' do
    assert_difference('Provider.count', -1) do
      delete proveedor_url(@proveedor)
    end

    assert_redirected_to proveedores_url
    assert_equal I18n.t('providers.destroy.success'), flash[:notice]
  end
end
