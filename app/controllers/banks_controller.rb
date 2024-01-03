class BanksController < ApplicationController
  def index
    @banks = Bank.all
  end

  def show
    @bank = Bank.find(params[:id])
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)

    if @bank.save
      redirect_to banks_url, notice: t('banks.created')
    else
      render :new
    end
  end

  def edit
    @bank = Bank.find(params[:id])
  end

  def update
    @bank = Bank.find(params[:id])

    if @bank.update(bank_params)
      # Actualiza la marca de tiempo de los proveedores asociados cuando se actualiza el banco
      @bank.providers.update_all(updated_at: Time.current)

      redirect_to banks_path, notice: t('banks.updated')
    else
      render :edit
    end
  end

  def destroy
    @bank = Bank.find(params[:id])

    # Actualiza la marca de tiempo de los proveedores asociados antes de eliminar el banco
    @bank.providers.update_all(updated_at: Time.current)

    @bank.destroy

    redirect_to banks_url, notice: t('banks.destroyed'), status: :see_other
  end

  private

  def bank_params
    params.require(:bank).permit(:name)
  end
end
