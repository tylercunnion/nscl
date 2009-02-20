class PublicationsController < ApplicationController
  def index
    redirect_to :action => "convention_ear"
  end
  
  def convention_ear
    if params[:year]
      @year = params[:year]
    else
      @year = Publication.maximum('date').year.to_s
    end
    @publications = Publication.find(:all, :conditions => "pub_type = 'Convention Ear'")
  end
  
 
end
