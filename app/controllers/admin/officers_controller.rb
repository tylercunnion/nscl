class Admin::OfficersController < AdminController
  
  before_filter :check_officer_permissions

  def index
    list
    render :action => 'list'
  end
  
  def list
    @officers = Officer.find(:all, :include => :member, :order => "officers.id")
  end
  
  private
  
  def check_officer_permissions
    unless current_user.edit_officers?
      redirect_to denied_url
    end
  end
  
end