# frozen_string_literal: true

module ActiveRecord
  class Base
    def self.sortable?
      column_names.include?('position')
    end
  end
end
