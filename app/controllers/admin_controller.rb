class AdminController < ApplicationController
  
  before_filter :login_required, :set_javascript
  skip_after_filter :add_google_analytics_code
  
end