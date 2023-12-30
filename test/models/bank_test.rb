require "test_helper"

class BankTest < ActiveSupport::TestCase
  test "El banco debe tener nombre" do
    bank = Bank.new(name: '')
    assert_not bank.valid?, 'Nombre en blanco o no válido'
  end

  test "El nombre no debe exceder los 50 caracteres" do
    bank = Bank.new(name: 'a' * 51)
    assert_not bank.valid?, 'nombre length not validated'
  end

  test "No deberia guardar un banco con el mismo nombre de otro" do
    existing_bank = banks(:one)
    new_bank = Bank.new(name: existing_bank.name)

    assert_not new_bank.save, "Se guardo un banco con el mismo nombre del otro"
  end
end
