class AdminController < ApplicationController
  
  before_filter :login_required
  
  def index
  end
  
  auto_complete_for :member, :last

  def auto_complete_for_member_name
    value = params[:member][:name]
    @members = Member.find(:all,
      :conditions => ["concat_ws(' ', first, last) like ?", "%" + value + "%"],
      :order => 'last, first',
      :limit => 10) 
    render :partial => 'results'
  rescue
    render :nothing
  end
  
end