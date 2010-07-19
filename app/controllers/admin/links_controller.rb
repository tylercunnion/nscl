class Admin::LinksController < AdminController
    
  require_role "links"
  cache_sweeper :link_sweeper, :only => [:create, :update, :destroy]
    
  def index
    list
    render :action => 'list'
  end
  
  def new
    @link = Link.new
  end
  
  def create
    @link = Link.new(params[:link])
    if @link.save
      flash[:notice] = 'Link successfully created'
      #redirect_to :action => "show", :id => @link
      redirect_to links_url(:anchor => "link-#{@link.id}")
    else
      render :action => "new"
    end
  end
  
  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      flash[:notice] = "Link successfully updated"
      #redirect_to link_url(@link)
      redirect_to links_url(:anchor => "link-#{@link.id}")
    else
      render :action => "edit"
    end
  end
  
  def list
    @links = Link.find(:all)
  end
  
  def show
    @link = Link.find(params[:id])
  end
  
  def edit
    @link = Link.find(params[:id])
  end
  
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_url
  end
  
end
