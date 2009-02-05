class Admin::LinksController < AdminController
  
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
      redirect_to :action => "show", :id => @link
    else
      render :action => "new"
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
  
  
end
