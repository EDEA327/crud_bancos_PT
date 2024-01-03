require 'test_helper'

class BankAccountTest < ActiveSupport::TestCase
  def setup
    @provider = providers(:one)  # Asegúrate de tener fixtures o crea un proveedor en la base de datos
    @bank_account = BankAccount.new(
      bank_name: 'Banco de Prueba',
      account_number: '123456789012345'
    )
    @provider.bank_account = @bank_account
  end

  test 'debería ser válido' do
    assert @bank_account.valid?
  end

  test 'nombre del banco debería estar presente' do
    @bank_account.bank_name = ''
    assert_not @bank_account.valid?
  end

  test 'número de cuenta no debería exceder la longitud máxima' do
    @bank_account.account_number = '1234567890123456'
    assert_not @bank_account.valid?
  end
end
