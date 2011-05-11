class UrlEntry < ActiveRecord::Base
  attr_accessible :key, :url
  
  url_regex = /((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?]))/i

  validates :key, :presence   => true,
                  :length     => { :maximum => 50 },
                  :format     => { :with => /\A[^\/]+\z/ },
                  :uniqueness => { :case_sensitive => false }

  validates :url, :presence => true,
                  :format   => { :with => url_regex }
end
