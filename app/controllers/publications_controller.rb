class PublicationsController < ApplicationController
  def index
    redirect_to :action => "convention_ear"
  end
  
  def convention_ear
    @page_title = "Convention Ear"
    get_pubs( "Convention Ear", params[:year] )
  end
  
  def letter
    @page_title = "Letter of the League"
    get_pubs( "Letter of the League", params[:year] )
  end
  
  private
  
  def get_pubs( pub_type, year )
    @publications = Publication.find(:all, :conditions => ["pub_type = ?", pub_type])
    if year
      @year = year
    else
      @year = Publication.maximum('date', :conditions => ["pub_type = ?", pub_type]).year.to_s
    end
  rescue
    @year = Date.today.year
  end
end
