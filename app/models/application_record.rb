# frozen_string_literal: true

# top-level active record. New record should inherit from this
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
