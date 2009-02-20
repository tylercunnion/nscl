class Publication < ActiveRecord::Base
  has_attached_file :publication, :styles => { :thumb => ["125x165>", :png]}
  
  def self.find_by_year( year )
    self.find(:all, :conditions => ["YEAR(date) = ?", year])
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
