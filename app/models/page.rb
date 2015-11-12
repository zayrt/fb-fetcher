class Page < ActiveRecord::Base
	validates :fb_id,		presence: true, uniqueness: { case_sensitive: false, message: " id has already been taken" }
end
