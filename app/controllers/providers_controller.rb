class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  def index
    @providers = Provider.paginate(page: params[:page], per_page: 10)
  end

  def show

  end

  def new
    @provider = Provider.new
    @provider.build_bank_account #Crea la cuenta de banco
    @banks = Bank.all # Para el combobox de bancos en el formulario
  end

  def create
    @provider = Provider.new(provider_params)
    @banks = Bank.all

    if @provider.save
      redirect_to providers_path, notice: t('providers.create.created')
    else
      @banks = Bank.all
      flash.now[:alert] = t('providers.create.error')
      render :new
    end
  end

  def edit

  end

  def update
    if @provider.update(provider_params)
      redirect_to providers_path, notice: t('providers.update.updated')
    else
      render :edit
    end
  end

  def destroy
    @provider.destroy
    redirect_to providers_url, notice: t('providers.destroy.destroyed')
  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params
    params.require(:provider).permit(:name, :nit, :contact_name, :contact_phone, :bank_id, :bank_account)
  end
end
