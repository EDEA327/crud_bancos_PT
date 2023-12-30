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

  private

  def invalid_long_name_attributes
    { name: "A" * 51}
  end
end
