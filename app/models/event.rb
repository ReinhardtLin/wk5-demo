class Event < ActiveRecord::Base
  validates_presence_of :name

  has_attached_file :logo, :style => { :medium => "300x300>", :thumb => "100X100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
