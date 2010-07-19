class Admin::SchoolsController < AdminController

  require_role "schools"
  cache_sweeper :school_sweeper, :only => [:create, :update, :destroy]
   
    
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
        #redirect_to school_url(@school)
        redirect_to schools_url(:anchor => "school-#{@school.id}")
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
      #redirect_to school_url(@school)
      redirect_to schools_url(:anchor => "school-#{@school.id}")
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
  
  def destroy
    @school = School.find(params[:id])
    @school.destroy
    redirect_to schools_url
  end
  
end
