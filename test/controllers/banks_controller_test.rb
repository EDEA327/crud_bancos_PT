require 'test_helper'

class BanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test "No debería crear un banco con un nombre de más de 50 caracteres" do
    assert_no_difference('Bank.count') do
      post banks_url, params: { bank: invalid_long_name_attributes }
    end

    assert_template "new"
    assert_instance_of Bank, assigns(:bank)
    assert assigns(:bank).new_record?
    assert_equal [I18n.t('activerecord.errors.models.bank.attributes.name.too_long')], assigns(:bank).errors[:name]
  end

  test "Debería mostrar la lista de bancos" do
    get banks_url
    assert_response :success
  end

  test "Debe mostrar el banco" do
    get bank_url(banks(:one))
    assert_response :success
  end

  test "Debe renderizar la url del nuevo banco" do
    get new_bank_url
    assert_response :success
  end

  test "Debe crear un banco" do
    assert_difference('Bank.count') do
      post banks_url, params: { bank: { name: "New Bank" } }
    end

    assert_redirected_to banks_url
    assert_equal flash[:notice], I18n.t('banks.created')
  end

  test "Debe actualizar el banco" do
    put bank_url(banks(:one)), params: { bank: { name: "Updated Bank" } }

    assert_response :redirect # Verifica que la respuesta sea una redirección

    follow_redirect! # Sigue la redirección

    assert_equal I18n.t('banks.updated'), flash[:notice] # Verifica el mensaje de notificación

    # Verifica que la actualización haya ocurrido correctamente
    assert_equal "Updated Bank", banks(:one).reload.name
  end



  test "Debe eliminar el banco" do
    assert_difference('Bank.count', -1) do
      delete bank_path(banks(:one))
    end

    assert_redirected_to banks_url
    assert_equal flash[:notice], I18n.t('banks.destroyed')
  end

  private

  def invalid_long_name_attributes
    { name: "A" * 51 }
  end
end
