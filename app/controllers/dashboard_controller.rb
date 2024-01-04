class DashboardController < ApplicationController
  before_action :authenticate_user!
  def show
    @providers_count = Provider.count
    @banks_count = Bank.count
  end
end
