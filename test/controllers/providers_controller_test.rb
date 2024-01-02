require "test_helper"

class ProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provider = providers(:one)
  end

  test "debería obtener nueva" do
    get providers_new_url
    assert_response :success
  end

  test "debería obtener crear" do
    get providers_create_url
    assert_response :success
  end

  test "debería obtener editar" do
    get providers_edit_url
    assert_response :success
  end

  test "debería obtener actualizar" do
    get providers_update_url
    assert_response :success
  end

  test "debería obtener destruir" do
    get providers_destroy_url
    assert_response :success
  end

  test "debería obtener índice" do
    get providers_url
    assert_response :success
  end

  test "debería crear proveedor" do
    assert_difference('Provider.count') do
      post providers_url, params: { provider: { name: 'Nuevo Proveedor', nit: '123456789-0', contact_name: 'John Doe' } }
    end

    assert_redirected_to provider_url(Provider.last)
    assert_equal 'El proveedor fue creado exitosamente.', flash[:notice]
  end

  test "debería mostrar proveedor" do
    get provider_url(@provider)
    assert_response :success
  end

  test "debería obtener editar" do
    get edit_provider_url(@provider)
    assert_response :success
  end

  test "debería actualizar proveedor" do
    patch provider_url(@provider), params: { provider: { name: 'Proveedor Actualizado' } }
    assert_redirected_to providers_url
    assert_equal 'El proveedor se actualizó exitosamente.', flash[:notice]
  end

  test "debería destruir proveedor" do
    assert_difference('Provider.count', -1) do
      delete provider_url(@provider)
    end

    assert_redirected_to providers_url
    assert_equal 'El proveedor se eliminó exitosamente.', flash[:notice]
  end
end
