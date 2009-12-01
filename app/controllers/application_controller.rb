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

  def rescue_action_in_public(exception)
    log_error(exception)
    render 'error/index', :status => 404
  end
  
  
end
