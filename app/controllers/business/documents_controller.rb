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
    @page_title = "NSCL Constitution"
  end
  
  
  
  
  

end