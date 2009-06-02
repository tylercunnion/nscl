class BusinessController < ApplicationController
  before_filter :sidebar
  
  private

  def sidebar
    @officers = Officer.find(:all) unless read_fragment("officer_sidebar_list")
  end
  
end