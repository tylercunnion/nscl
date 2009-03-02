class Members::ScholarshipsController < ApplicationController
  def index
    redirect_to :action => "hal_rather"
  end
  
  def hal_rather
    @page_title = "Hal Rather Award"
  end
  
  def hal_rather_application
    @page_title = "Hal Rather Application"
  end
  
  def nscl_scholarship_application
    @page_title = "NSCL Scholarship Application"
  end
  
  def nscl_scholarship
    @page_title = "NSCL Scholarship"
  end
  
  def mark_schapler
    @page_title = "Mark Schapler Award"
  end
  
  
  
  def apply_hal_rather
    Mail.deliver_hal_rather_application(params)
    redirect_to :action => :thanks
  end
  
  def apply_nscl_scholarship
    Mail.deliver_nscl_scholarship_application(params)
    redirect_to :action => :thanks
  end
  
end
