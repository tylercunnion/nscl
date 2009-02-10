class Admin::PublicationsController < AdminController
  
  before_filter :login_required
  
  def index
    @publications = Publication.find(:all, :order => 'date')
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @publications.to_xml }
    end
  end
  
  def create
    if @publication = Publication.create(params[:publication])
      flash[:notice] = 'Publication successfully uploaded.'
      redirect_to publication_url(@publication)
    else
      render :action => 'new'
    end
  end
  
  def update
    if @publication = Publication.update(params[:id], params[:publication])
      flash[:notce] = 'Publication successfully updated.'
      redirect_to publication_url(@publication)
    else
      render :action => 'edit'
    end
  end
  
  
  def new
    @publication = Publication.new
  end
  
  def show
    @publication = Publication.find(params[:id])
  end
  
  def edit
    @publication = Publication.find(params[:id])
  end
  
  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy
  end
  
  private
  
  def check_publications_permissions
    logged_in? && current_user.edit_publications?
  end

  
end