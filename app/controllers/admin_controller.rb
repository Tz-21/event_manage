class AdminController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, :find_namespace#, :admin_required

  private

  # def admin_required
  #   redirect_back(fallback_location: root_path) unless current_user.is_admin?
  # end

end
