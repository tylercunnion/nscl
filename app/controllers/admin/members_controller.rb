class Admin::MembersController < ApplicationController
  
  require 'readline'
  include Readline
  
  auto_complete_for :member, :last

  def auto_complete_for_member_name
    value = params[:member][:name]
    @members = Member.find(:all,
      :conditions => ["concat_ws(' ', first, last) like ?", "%" + value + "%"],
      :order => 'last, first',
      :limit => 10) 
    render :partial => 'results'
  rescue
    render :nothing
  end
  
  def auto_complete_for_member_register
    value = params[:member][:register]
    @members = Member.find(:all,
      :conditions => ["concat_ws(' ', first, last) like ?", "%" + value + "%"],
      :order => 'last, first',
      :limit => 10,
      :include => 'state')
    render :partial => 'register_results'
  end
  
  def new
    @member = Member.new(:first => "", :last => "")
    @schools = School.find(:all, :order => "name")
    @states = State.find(:all)
    @years = get_years
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
        flash[:notice] = 'Member successfully created.'
        redirect_to :action => 'show', :id => @member
    else
        @schools = School.find(:all, :order => "name")
        @states = State.find(:all)
        @years = get_years
        render :action => 'new'
    end
  end
  
  def edit
    @member = Member.find(params[:id])
    @schools = School.find(:all, :order => "name")
    @states = State.find(:all)
    @years = get_years
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      flash[:notice] = 'Member successfully updated.'
      redirect_to :action => 'show', :id => @member
    else
      @schools = School.find(:all, :order => "name")
      @states = State.find(:all)
      @years = get_years
      render :action => 'edit'
    end
  end
  
  def show
    @member = Member.find(params[:id], :include => ['school', 'state', 'home_state', 'school_state'])
  end
  
  def register
    @member = Member.find(params[:id], :include => ['school', 'state'])
    writefile = File.open("convention_registration.csv", "a")
    writefile.puts("\"" + @member.first + "\", \"" + @member.last + "\", " + @member.grad_year.to_s + "\n")
    writefile.close
    #redirect_to :action => "registration"
  end
  
private

  def get_years
    years = []
    x = Date.today.year + 2
    30.times do
      years << x
      x = x - 1
    end
    return years
  end
  
  def capitalize
    @members = Member.find(:all)
    @members.each do |m|
      array = m.first.split(' ')
      array.each_index do |x|
        array[x] = array[x].capitalize
      end
      m.first = array.join(' ')
      
      array = m.last.split(' ')
      array.each_index do |x|
        array[x] = array[x].capitalize
      end
      m.last = array.join(' ')    
      m.save
    end
  end
  
  
end
