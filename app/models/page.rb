class Page < ActiveRecord::Base
  belongs_to :category, :class_name => "PageCategory"
  
  validates_uniqueness_of :address, :scope => :category_id, :message => "Page name already exists in this directory."
end
