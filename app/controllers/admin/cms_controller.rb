class Admin::CmsController < AdminController
  
  #require_role "cms"
  
  def index
    @categories = PageCategory.find(:all, :order => "name DESC")
  end

    
    
end