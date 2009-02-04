class Business::DocumentsController < ApplicationController
  
  def index
    redirect_to :action => 'creed'
  end

end