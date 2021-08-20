class Site < ApplicationRecord
  has_many :hotels, :through => :site_hotels  
  has_many :site_hotels, :dependent => :destroy  
end
  