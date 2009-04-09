class AdminController < ApplicationController
  
  before_filter :login_required, :set_javascript
  
  def cms
    redirect_to page_categories_url
  end
  
end