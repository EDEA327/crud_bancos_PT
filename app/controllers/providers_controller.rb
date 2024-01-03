class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  def index
    @providers = Provider.paginate(page: params[:page], per_page: 10)
  end

  def show
    byebug
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)

    # Asociar el proveedor con el banco seleccionado
    @provider.bank = Bank.find(params[:provider][:bank_id])

    if @provider.save
      redirect_to providers_url, notice: I18n.t('providers.create.success')
    else
      puts "Errors: #{@provider.errors.full_messages}"
      render :new
    end
  end

  def edit
  end

  def update
    if @provider.update(provider_params)
      redirect_to @provider, notice: I18n.t('providers.update.success')
    else
      render :edit
    end
  end

  def destroy
    @provider.destroy
    redirect_to providers_url, notice: I18n.t('providers.destroy.success')
  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params
    params.require(:provider).permit(:name, :nit, :contact_name, :contact_phone, :bank_id)
  end
end
