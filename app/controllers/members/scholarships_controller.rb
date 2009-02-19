class Members::ScholarshipsController < ApplicationController
  def index
    redirect_to :action => "hal_rather"
  end
  
  def apply_hal_rather
    Mail.deliver_hal_rather_application(params)
  end
  
end
