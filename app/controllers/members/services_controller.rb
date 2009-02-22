class Members::ServicesController < ApplicationController
  before_filter :authenticate, :except => [:login, :verify]
  
  def index
    redirect_to :action => "directory"
  end
  
  def directory
    @page_title = "NSCL Member Directory"
  end
  
  
  def login
    @next_page = params[:nextpage]
  end
  
  def search_by_name
    if params[:name].blank?
      redirect_to :action => "directory" and return
    end
    offset = params[:offset].to_i
    offset ||= 0
    
    @count = Member.count(:all,
                          :conditions => ["concat_ws(' ', first, last) like ? and public = true", "%" + params[:name] + "%"])
    @results = Member.find(:all,
                           :conditions => ["concat_ws(' ', first, last) like ? and public = true", "%" + params[:name] + "%"], 
                           :include => ['school', 'state'],
                           :order => "last, first",
                           :offset => offset,
                           :limit => PAGE_SIZE)
    @search_term = params[:name]
    @pages = (@count.to_f / PAGE_SIZE).ceil
    @offset = offset
  end
  
  def browse
    @page_title = "Browse Directory"
    offset = params[:offset].to_i
    offset ||= 0
    case params[:browse_method]
      when "last"
        browse_by_last(params[:browse_filter], offset)
      when "first"
        browse_by_first(params[:browse_filter], offset)
      when "school"
        browse_by_school(params[:browse_filter], offset)
      when "delegation"
        browse_by_delegation(params[:browse_filter], offset)
      else
        redirect_to :action => "directory"
    end
    @count ||= 0
    @pages = (@count.to_f / PAGE_SIZE).ceil
    @offset = offset
    @browse_filter = params[:browse_filter]
  end
 
  def verify
    if params[:password] == "bumblebee"
      session[:member] = true
      redirect_to :action => params[:next_page] 
    else
      redirect_to :action => "login", :nextpage => params[:next_page]
    end
       
  end
  
protected
 
  def browse_by_last(browse_filter, offset)
    browse_filter ||= "a"
    browse_filter += '%'
    @filters = get_alphabet
    @browse_method_name = "Last Name"
    @browse_method = "last"
    @filter = browse_filter
    @count = Member.count(:all,
                          :conditions => ["last like ? and public = true", browse_filter])
    @results = Member.find(:all,
                           :conditions => ["last like ? and public = true", browse_filter],
                           :include => ['school', 'state'],
                           :order => "last, first",
                           :limit => PAGE_SIZE,
                           :offset => offset)
  end
  
  def browse_by_first(browse_filter, offset)
    browse_filter ||= "a"
    browse_filter += '%'
    @filters = get_alphabet
    @browse_method_name = "First Name"
    @browse_method = "first"
    @filter = browse_filter
    @count = Member.count(:all,
                          :conditions => ["first like ? and public = true", browse_filter])
    @results = Member.find(:all,
                           :conditions => ["first like ? and public = true", browse_filter],
                           :include => ['school', 'state'],
                           :order => "first, last",
                           :limit => PAGE_SIZE,
                           :offset => offset)
  end
  
  def browse_by_school(browse_filter, offset)
    @schools = School.find(:all, :order => "name")
    
    @filters = Array.new
    @schools.each do |s|
      @filters << BrowseFilter.new("#{s.name}", "#{s.name}")
    end  
    browse_filter ||= @filters.first.id
    @browse_method_name = "School"
    @browse_method = "school"
    @filter = browse_filter.to_i
    @count = Member.count(:all,
                          :include => :school,
                          :conditions => ["schools.name = ? and public = true", browse_filter])
    @results = Member.find(:all,
                           :conditions => ["schools.name = ? and public = true", browse_filter],
                           :include => ['school', 'state'],
                           :order => "last, first",
                           :limit => PAGE_SIZE,
                           :offset => offset)
  end
  
  def browse_by_delegation(browse_filter, offset)
    @states = State.find(:all, :order => "name")
    
    @filters = Array.new
    @states.each do |s|
      @filters << BrowseFilter.new("#{s.abbreviation}", "#{s.name}")
    end
    
    browse_filter ||= @filters.first.id
    @browse_method_name = "Delegation"
    @browse_method = "delegation"
    @filter = browse_filter
    @count = Member.count(:all,
                          :include => :state,
                          :conditions => ["states.abbreviation = ? and public = true", browse_filter])
    @results = Member.find(:all,
                           :conditions => ["states.abbreviation = ? and public = true", browse_filter],
                           :include => ['school', 'state'],
                           :order => "last, first",
                           :limit => PAGE_SIZE,
                           :offset => offset)
  end
  
  def get_alphabet
    letter = 'A'
    browse_filters = Array.new
    26.times do
      browse_filters << BrowseFilter.new("#{letter}", "#{letter}")
      letter.next!
    end
    return browse_filters
  end
  
  def authenticate
    unless session[:member]
      redirect_to :action => "login", :nextpage => params[:action]
    end
  end
  

  
end
