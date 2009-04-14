class Business::DocumentsController < BusinessController

  caches_page :creed, :song, :constitution

  def index
    redirect_to :action => 'creed'
  end
  
  def creed
    @page_title = "NSCL Creed"
  end
  
  def song
    @page_title = "NSCL Song"
  end
  
  def constitution
    @page_title = "NSCL Constitution"
  end
  
  enable_sitemap
  

end