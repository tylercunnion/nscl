class ErrorController < ApplicationController
  def index
    render(:status => 404, :layout => true)
  end
end