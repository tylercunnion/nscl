class Admin::PublicationsController < AdminController
  
  before_filter :check_publications_permissions
  
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
    @publication = Publication.find(params[:id], :include => [:editor])
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
    unless current_user.edit_publications?
      redirect_to denied_url
    end
  end

  
end