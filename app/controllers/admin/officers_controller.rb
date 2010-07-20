class Admin::OfficersController < AdminController
  
  require_role "officers"
  cache_sweeper :officer_sweeper, :only => [:create, :update, :destroy]

  def index
    @officers = Officer.find(:all, :include => :member, :order => "officers.id")
  end
  
  def edit
    @officer = Officer.find(params[:id])
    
    @members = Member.find(:all, :order => :last).select { |item| item.primary_member? }
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