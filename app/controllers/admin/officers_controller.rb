class Admin::OfficersController < AdminController
  
  require_role "officers"
  cache_sweeper :officer_sweeper, :only => [:create, :update, :destroy]

  def index
    @officers = Officer.find(:all, :include => :member, :order => "officers.id")
  end
  
  def edit
    @officer = Officer.find(params[:id])
    
    #This finds primary members, as only they can be officers.
    d = Date.today
    if d.month <= 8 #August
      year = d.year - 4
    else
      year = d.year - 3
    end
    @members = Member.find(:all, :conditions => {:grad_year => year..d.year}, :order => :last)
  end
  
  def show
    @officer = Officer.find(params[:id])
  end
  
  def new
    @officer = Officer.new
  end
  
  def update
    if Officer.update(params[:id], params[:officer])
      redirect_to officer_url(params[:id])
    else
      render 'edit'
    end
  end
end