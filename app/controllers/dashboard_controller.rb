class DashboardController < ApplicationController
  before_action :authenticate_user!
  def show
    @providers_count = current_user.providers.count
    @banks_count = current_user.banks.count
  end
end
