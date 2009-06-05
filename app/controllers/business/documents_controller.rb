class Business::DocumentsController < BusinessController

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
    Rubaidh::GoogleAnalytics.defer_load = false
    @page_title = "NSCL Constitution"
  end
  
  enable_sitemap
  

end