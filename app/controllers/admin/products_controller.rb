class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  
end
