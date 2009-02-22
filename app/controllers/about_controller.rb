class AboutController < ApplicationController

 def index
    render :action => 'about_scl'
  end

  
  def join
    @page_title = "Join NSCL"
    @schools = School.find(:all, :order => "name ASC")
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
    
    case params[:commit]
    when "I will send payment"
      render :action => 'submit_application'
      Mail.deliver_membership_thanks(applicant, false)
    when "I will pay online"  
      render :action => 'pay_online'
      Mail.deliver_membership_thanks(applicant, true)
    end
    
    Mail.deliver_membership_request(applicant, school, in_database)
  end
    
  def states
    @page_title = "State Chapters"
    @links = Link.find(:all, :order => "name")
  end
  
  def website
    @page_title = "About the Website"
  end
  
end
