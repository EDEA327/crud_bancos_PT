require 'test_helper'

class BanksControllerTest < ActionDispatch::IntegrationTest
  test "No deberia crear un banco con un nombre de más de 50 caracteres" do
    assert_no_difference('Bank.count') do
      post banks_url, params: { bank: invalid_long_name_attributes }
    end

    assert_template "new"
    assert_instance_of Bank, assigns(:bank)
    assert assigns(:bank).new_record?
    assert_equal ["is too long (maximum is 50 characters)"], assigns(:bank).errors[:name]
  end

  test "Deberia mostrar la lista de bancos" do
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
    post banks_url, params: { bank: { name: "New Bank" } }
    assert_redirected_to banks_url
    assert_equal flash[:notice], 'El banco fue creado exitosamente.'
  end

  test "Debe actualizar el banco" do
    patch bank_url(banks(:one)), params: { bank: { name: "Updated Bank" } }
    assert_redirected_to banks_url
  end

  test "Debe eliminar el banco" do
    assert_difference('Bank.count', -1) do
      delete bank_path(banks(:one))
    end

    assert_redirected_to banks_path
    assert_equal flash[:notice], "El banco #{banks(:one).name} se eliminó exitosamente."
  end

  private

  def invalid_long_name_attributes
    { name: "A" * 51}
  end
end
