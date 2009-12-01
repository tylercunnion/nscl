class AdminController < ApplicationController
  
  before_filter :login_required, :set_javascript
  
end