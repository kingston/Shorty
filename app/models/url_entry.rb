class UrlEntry < ActiveRecord::Base
  attr_accessible :short_name, :url
  
  url_regex = /((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))/i
  
  validates :short_name, :presence   => true,
                         :length     => { :maximum => 50 },
                         :uniqueness => { :case_sensitive => false }

  validates :url, :presence => true,
                  :format   => { :with => url_regex }
end
