class Publication < ActiveRecord::Base
  has_attached_file :publication, :styles => { :thumb => ["125x165>", :png]}
  belongs_to :editor, :class_name => "Member", :foreign_key => "editor_id"
  
  def find_by_year(year)
    #return self.find(:all, :conditions => [""])
  end
  
  def blank?
    if self.id.nil?
      return true
    else
      return false
    end
  end
  
end
