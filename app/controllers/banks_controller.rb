class BanksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bank, only: [:show, :edit, :update, :destroy]

  def index
    @banks = Bank.all
  end

  def show
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)
    @bank.user = current_user

    if @bank.save
      redirect_to banks_url, notice: t('banks.created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bank.update(bank_params)
      update_providers_timestamp
      redirect_to banks_path, notice: t('banks.updated')
    else
      render :edit
    end
  end

  def destroy
    update_providers_timestamp
    @bank.destroy

    redirect_to banks_url, notice: t('banks.destroyed'), status: :see_other
  end

  private

  def set_bank
    @bank = Bank.find(params[:id])
  end

  def bank_params
    params.require(:bank).permit(:name)
  end

  def update_providers_timestamp
    @bank.providers.update_all(updated_at: Time.current)
  end
end
