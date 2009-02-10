class Admin::OfficersController < AdminController
  
  before_filter :login_required

  def index
    @officers = Officer.find(:all, :include => :member, :order => "officers.id")
  end
  
  private
  
  def authorized?
    logged_in? && current_user.edit_officers?
  end
  
end