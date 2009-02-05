class Admin::PublicationsController < AdminController
  
  def index
    list
    render :action => 'list'
  end
  
  def create
    if @publication = Publication.create(params[:publication])
      flash[:notice] = 'Publication successfully uploaded.'
      redirect_to :action => 'show', :id => @publication
    else
      render action => 'new'
    end
  end
  
  def update
    if @publication = Publication.update(params[:id], params[:publication])
      flash[:notce] = 'Publication successfully updated.'
      redirect_to :action => 'show', :id => @publication
    else
      render action => 'edit'
    end
  end
  
  
  def new
    @publication = Publication.new
  end
  
  def list
    @publications = Publication.find(:all, :order => 'date')
  end
  
  def show
    @publication = Publication.find(params[:id])
  end
  
  def edit
    @publication = Publication.find(params[:id])
  end

  
end