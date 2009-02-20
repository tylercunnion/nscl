class PublicationsController < ApplicationController
  def index
    redirect_to :action => "convention_ear"
  end
  
  def convention_ear
    if params[:year]
      @year= params[:year]
    else
      @year = Publication.maximum('YEAR(date)')
    end
    @publications = Publication.find(:all, :conditions => "pub_type = 'Convention Ear'")
  end
  
 
end
