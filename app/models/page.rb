class Page < ApplicationRecord
	has_paper_trail
	validates :slug, presence: true, uniqueness: { case_sensitive: true }
end
