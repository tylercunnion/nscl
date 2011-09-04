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
  
  def book_award
    @page_title = "Book Award"
  end
  
  def mark_schapler
    redirect_to :action => "book_award", :status => 301
  end
  
  def donors
    @page_title = "Donor Thank You List"
  end
  
  
  
  def apply_hal_rather
    spam = SpamFilter.new
    if spam.is_legit?(params)
      Mail.deliver_hal_rather_application(params)
      redirect_to :action => :thanks
    else
      redirect_to :action => :failure
    end
  end
  
  def apply_nscl_scholarship
    spam = SpamFilter.new
    if spam.is_legit?(params)
      Mail.deliver_nscl_scholarship_application(params)
      redirect_to :action => :thanks
    else
      redirect_to :action => :failure
    end
  end
  
  enable_sitemap :except => ["apply_hal_rather", "apply_nscl_scholarship"]
end
