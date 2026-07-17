# frozen_string_literal: true

class AddFailedAttemptsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :failed_attempts, :integer
  end
end
