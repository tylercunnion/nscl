class Mail < ActionMailer::Base
  def membership_thanks( applicant, paid_online )
    recipients applicant.email
    from "webmaster@nscl.org"
    subject "Your membership application has been received"
    body :paid_online => paid_online
  end
  
  def membership_request( applicant, school, in_database )
    recipients "treasurer@nscl.org"
    from "webmaster@nscl.org"
    subject "Membership Application: " + applicant.first + " " + applicant.last
    body :applicant => applicant, :school => school, :in_database => in_database
  end
  
  def hal_rather_application( form )
    recipients HAL_CONTACT
    from "webmaster@nscl.org"
    subject "Hal Rather Application: " + form[:name]
    body :form => form
  end
  
  def nscl_scholarship_application( form )
    recipients NSCL_SCHOL_CONTACT
    from "webmaster@nscl.org"
    subject "NSCL Scholarship Application: " + form[:name]
    body :form => form
  end
  
  def event_chair ( form )
    recipients VP_ADDRESS
    from "webmaster@nscl.org"
    subject "Event Chair Application: " + form[:name]
    body :form => form
  end
end
