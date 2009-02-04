class Members::ScholarshipsController < ApplicationController
  def index
    redirect_to :action => "hal_rather"
  end
  
  def apply_hal_rather
    form = Hash.new
    form[:name] = params[:name]
    #form[:]
  end
  
end
