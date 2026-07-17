# frozen_string_literal: true

# These are pages on the site
#
class Page < ApplicationRecord
  has_paper_trail
  validates :slug, presence: true, uniqueness: { case_sensitive: true }
end
