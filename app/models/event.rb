class Event < ActiveRecord::Base
  has_attached_file :picture, :styles => { :thumb => "200x1000>" }
end
