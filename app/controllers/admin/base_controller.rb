class Admin::BaseController < ApplicationController
  before_action :require_admin

  def require_admin
    render file: "app/views/errors/not_found.html.erb" unless current_admin?
  end
end
