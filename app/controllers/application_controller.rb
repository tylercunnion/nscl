# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  
  include SitemapXml
  
  include AuthenticatedSystem
  include RoleRequirementSystem

  before_filter :login_from_cookie
  
  def set_javascript
    logger.debug "Javascripts on"
    @javascripts = true
  end


  def method_missing(methodname, *args)
    logger.debug "Method: " + methodname
    begin
      default_render
    rescue ActionView::MissingTemplate => e
      render 'error/index', :status => 404
    end
   end
  
end
