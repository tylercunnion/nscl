class Admin::OfficersController < AdminController
  
  def index
    list
    render :action => 'list'
  end
  
  def list
    @officers = Officer.find(:all, :include => :member, :order => "officers.id")
  end
  
end