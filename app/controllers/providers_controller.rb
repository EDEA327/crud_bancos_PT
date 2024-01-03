class ProvidersController < ApplicationController
  before_action :authenticate_user!

  def index
    @providers = current_user.providers.paginate(page: params[:page], per_page: 10)
  end

  def show
    @provider = current_user.providers.find(params[:id])
  end

  def new
    @provider = current_user.providers.build
  end

  def create
    @provider = current_user.providers.build(provider_params)

    if @provider.save
      redirect_to providers_url, notice: I18n.t('providers.create.success')
    else
      puts "Errors: #{provider.errors.full_messages}"
      render :new
    end
  end

  def edit
    @provider = current_user.providers.find(params[:id])
  end

  def update
    @provider = current_user.providers.find(params[:id])

    if @provider.update(provider_params)
      redirect_to @provider, notice: I18n.t('providers.update.success')
    else
      render :edit
    end
  end

  def destroy
    @provider = current_user.providers.find(params[:id])
    @provider.destroy

    redirect_to providers_url, notice: I18n.t('providers.destroy.success')
  end

  private

  def provider_params
    params.require(:provider).permit(:name, :nit, :contact_name, :contact_phone, :bank_id, :account_number)
  end
end
