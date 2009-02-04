class Members::ServicesController < ApplicationController
  before_filter :authenticate, :except => [:login, :verify]
  
  def index
    redirect_to :action => "directory"
  end
  
  def login
    @next_page = params[:nextpage]
  end
  
  def search_by_name
    if params[:name] == "" or params[:name] == nil
      redirect_to :action => "directory" and return
    end
    
    offset = params[:offset].to_i
    offset ||= 0
    if params[:next]
      offset += 10
    end
    if params[:previous]
      offset -= 10
    end
    if params[:commit]
      offset = 0
    end      
    
    @count = Member.count(:all,
                          :conditions => ["concat_ws(' ', first, last) like ? and public = true", "%" + params[:name] + "%"])
    @results = Member.find(:all,
                           :conditions => ["concat_ws(' ', first, last) like ? and public = true", "%" + params[:name] + "%"], 
                           :include => ['school', 'delegation', 'second_delegation'],
                           :order => "last, first",
                           :offset => offset,
                           :limit => 10)
    @search_term = params[:name]
    @pages = (@count / 10) + 1
    @offset = offset
  end
  
  def browse
    offset = params[:offset].to_i
    offset ||= 0
    if params[:next]
      offset += 10
    end
    if params[:previous]
      offset -= 10
    end
    if params[:commit]
      offset = 0
    end
    case params[:method]
    when "last"
      browse_by_last(params[:filter], offset)
    when "first"
      browse_by_first(params[:filter], offset)
    when "school"
      browse_by_school(params[:filter], offset)
    when "delegation"
      browse_by_delegation(params[:filter], offset)
    when nil
      redirect_to :action => "directory"
    end
    @pages = (@count  / 10) + 1
    @offset = offset
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
 
  def browse_by_last(filter, offset)
    filter ||= "a%"
    @filters = get_alphabet
    @browse_method = "Last Name"
    @method = "last"
    @filter = filter
    @count = Member.count(:all,
                          :conditions => ["last like ? and public = true", filter])
    @results = Member.find(:all,
                           :conditions => ["last like ? and public = true", filter],
                           :include => ['school', 'state', 'home_state', 'school_state'],
                           :order => "last, first",
                           :limit => 10,
                           :offset => offset)
  end
  
  def browse_by_first(filter, offset)
    filter ||= "a%"
    @filters = get_alphabet
    @browse_method = "First Name"
    @method = "first"
    @filter = filter
    @count = Member.count(:all,
                          :conditions => ["first like ? and public = true", filter])
    @results = Member.find(:all,
                           :conditions => ["first like ? and public = true", filter],
                           :include => ['school', 'state', 'home_state', 'school_state'],
                           :order => "first, last",
                           :limit => 10,
                           :offset => offset)
  end
  
  def browse_by_school(filter, offset)
    @filters = School.find(:all, :order => "name")
    filter ||= @filters.first.id
    @browse_method = "School"
    @method = "school"
    @filter = filter.to_i
    @count = Member.count(:all,
                          :conditions => ["school_id = ? and public = true", filter])
    @results = Member.find(:all,
                           :conditions => ["school_id = ? and public = true", filter],
                           :include => ['school', 'state', 'home_state', 'school_state'],
                           :order => "last, first",
                           :limit => 10,
                           :offset => offset)
  end
  
  def browse_by_delegation(filter, offset)
    @filters = State.find(:all, :order => "name")
    filter ||= @filters.first.id
    @browse_method = "Delegation"
    @method = "delegation"
    @filter = filter.to_i
    @count = Member.count(:all,
                          :conditions => ["state_id = ? and public = true", filter])
    @results = Member.find(:all,
                           :conditions => ["state_id = ? and public = true", filter],
                           :include => ['school', 'state', 'home_state', 'school_state'],
                           :order => "last, first",
                           :limit => 10,
                           :offset => offset)
  end
  
  def get_alphabet
    letter = 'A'
    filters = Array.new
    26.times do
      filters << Filter.new("#{letter}%", "#{letter}")
      letter.succ!
    end

    return filters
  end
  
  def authenticate
    unless session[:member]
      redirect_to :action => "login", :nextpage => params[:action]
    end
  end
  

  
end
