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
end
