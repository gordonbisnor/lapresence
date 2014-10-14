class ActiveRecord::Base
  def self.sortable?
    column_names.include?("position")
  end
end

