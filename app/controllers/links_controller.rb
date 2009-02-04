class LinksController < ApplicationController
  def index
    redirect_to :action => 'scl'
  end
  
  def scl
    @national_links = Link.find(:all, :conditions => "section = 'National'")
    @state_links = Link.find(:all, :conditions => "section = 'State'")
  end
  
  def classics
    @classics_links = Link.find(:all, :conditions => "section = 'Classical'")
    @search_links = Link.find(:all, :conditions => "section = 'Classical search'")
  end
    
end
