class LinksController < ApplicationController
  def index
    redirect_to :action => 'scl'
  end
  
  def scl
    @national_links = Link.find(:all, :conditions => "section = 'national'")
    @state_links = Link.find(:all, :conditions => "section = 'state'")
  end
  
  def classics
    @classics_links = Link.find(:all, :conditions => "section = 'classical'")
    @search_links = Link.find(:all, :conditions => "section = 'classical search'")
  end
    
end
