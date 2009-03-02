class Admin::OfficersController < AdminController
  
  require_role "officers"

  def index
    @officers = Officer.find(:all, :include => :member, :order => "officers.id")
  end
  
end