class BusinessController < ApplicationController
  before_filter :sidebar
  
  private

  def sidebar
    @officers = Officer.find(:all)
  end
  
end