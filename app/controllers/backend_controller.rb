class BackendController < ApplicationController
  layout "backend"
  before_action :authenticate_user!, :find_namespace

end
