class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper :all
  
  before_filter :authenticate_company_user!
  # before_filter :protect_company_user_pages
  #  
  #  def protect_company_user_pages
  #    redirect_to company_userunless unless company_user_signed_in?
  #  end

end
