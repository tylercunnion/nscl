class AboutController < ApplicationController
  
  def index
    render :action => 'about_scl'
  end

  def ie6
    @page_title = "Out-of-date Browser"
  end
  
  def join
    @page_title = "Join NSCL"
    @schools = School.find(:all, :order => "name ASC")
    @states = State.find(:all, :order => "name ASC")
    @member = Member.new
  end
  
  def submit_application
    @member = Member.new(params[:member])
    @member.active = false
        
    if @member.school_id == 0
      school = School.create(:name => params[:school_other])
      @member.school = school
    else
      school = School.find(@member.school_id)
    end
    
    if @member.save
      Mail.deliver_membership_thanks(@member, false)
      Mail.deliver_membership_request(@member, school)
    else
      @schools = School.find(:all, :order => "name ASC")
      @states = State.find(:all, :order => "name ASC")
      render :action => 'join'
    end
  end
    
  def states
    Rubaidh::GoogleAnalytics.defer_load = false
    @page_title = "State Chapters"
    @links = Link.find(:all, :order => "name")
  end
  
  def website
    @page_title = "About the Website"
  end
  
  enable_sitemap :except => [:submit_application]
end
