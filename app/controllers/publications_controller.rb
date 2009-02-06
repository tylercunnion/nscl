class PublicationsController < ApplicationController
  def index
    redirect_to :action => "convention_ear"
  end
  
  def convention_ear
    if params[:year]
      @publications = Publication.find_by_year(params[:year])
    else
      
    end
  end
  
 
end
