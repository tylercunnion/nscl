class Publication < ActiveRecord::Base
  has_attached_file :publication, :styles => { :thumb => ["125x165>", :png]}, :url => "/files/:pub_type/:style/:year/:date.:extension", :path => ":rails_root/public/files/:pub_type/:style/:year/:date.:extension"
  validates_uniqueness_of :date, :scope => :pub_type
  
  def self.find_by_year( year )
    self.find(:all, :conditions => {:date => Date.new(year, 1,1)..Date.new(year, 12, 31)})
  end
  
  def blank?
    if self.id.nil?
      return true
    else
      return false
    end
  end
  
  def year
    self.date.strftime('%Y')
  end
  
end
