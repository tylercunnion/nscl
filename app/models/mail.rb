class Mail < ActionMailer::Base
  def membership_thanks( applicant, paid_online )
    recipients applicant.email
    from "web@nscl.org"
    subject "Your membership application has been received"
    body :paid_online => paid_online
  end
  
  def membership_request( applicant, school, in_database )
    recipients "treasurer@nscl.org"
    from "web@nscl.org"
    subject "Membership Application: " + applicant.first + " " + applicant.last
    body :applicant => applicant, :school => school, :in_database => in_database
  end
end
