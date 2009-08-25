class PublicationsController < ApplicationController
  def index
    redirect_to :action => "convention_ear"
  end
  
  def convention_ear
    unless read_fragment({:year => params[:year] || 3000})
      get_pubs( "Convention Ear", params[:year] )
    end
    @page_title = "Convention Ear #{params[:year]}"
  end
  
  def letter
    get_pubs( "Letter of the League", params[:year] )
    @page_title = "Letter of the League #{params[:year]}"
  end
  
  enable_sitemap :except => :index,
                 :dynamic => {:convention_ear => {:collection => [nil] + Publication.find(:all, :conditions => {:pub_type => "Convention Ear"}).group_by(&:year).collect {|year, pub| year}},
                              :letter => {:collection => [nil] + Publication.find(:all, :conditions => {:pub_type => "Letter of the League"}).group_by(&:year).collect {|year, pub| year}}},
                 :param => :year
  
  
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
