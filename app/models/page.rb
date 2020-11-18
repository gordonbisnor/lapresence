class Page < ApplicationRecord
	has_paper_trail
	validates_uniqueness_of :slug, case_sensitive: true
end
