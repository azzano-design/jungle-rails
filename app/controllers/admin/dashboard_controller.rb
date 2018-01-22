class Admin::DashboardController < ApplicationController

  # Added HTTP basic authentication
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'] , password: ENV['ADMIN_PASSWORD']

  def show
  end
end
