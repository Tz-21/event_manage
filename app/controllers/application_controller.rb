class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def find_namespace
    @namespace = controller_path.split('/').first
  end
end
