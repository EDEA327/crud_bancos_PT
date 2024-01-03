class DashboardController < ApplicationController
  def show
    @providers_count = Provider.count
    @banks_count = Bank.count
  end
end
