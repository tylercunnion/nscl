class PageCategory < ActiveRecord::Base
  has_many :pages, :foreign_key => "category_id", :dependent => :destroy
  
  validates_uniqueness_of :name
end
