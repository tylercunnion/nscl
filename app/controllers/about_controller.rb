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
    applicant = Member.new(params[:member])
    if applicant.school_id == 0
      school = School.new do |s|
        s.name = params[:school_other]
      end
      in_database = false
    else
      school = School.find(applicant.school_id)
      in_database = true
    end
=begin    
    case params[:commit]
    when "I will send payment"
      render :action => 'submit_application'
      Mail.deliver_membership_thanks(applicant, false)
    when "I will pay online"  
      render :action => 'pay_online'
      Mail.deliver_membership_thanks(applicant, true)
    end
=end
    Mail.deliver_membership_thanks(applicant, false)
    
    Mail.deliver_membership_request(applicant, school, in_database)
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
