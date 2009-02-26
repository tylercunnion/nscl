class Admin::SchoolsController < AdminController

  require_role "schools" 
    
  def index
    list
    render :action => 'list'
  end
  
  def new
    @school = School.new
  end
  
  def create
    @school = School.new(params[:school])
    if @school.save
        flash[:notice] = 'School successfully created.'
        redirect_to :action => 'show', :id => @school
    else
        render :action => 'new'
    end
  end
  
  def edit
    @school = School.find(params[:id])
  end
  
  def update
    @school = School.find(params[:id])
    if @school.update_attributes(params[:school])
      flash[:notice] = 'School successfully updated.'
      redirect_to :action => 'show', :id => @member
    else
      render :action => 'edit'
    end
  end
  
  def show
    @school = School.find(params[:id])
  end
  
  def list
    @schools = School.find(:all, :order => 'name')
  end
  
end
