class Championship < ApplicationRecord
  has_one :current_issue
  has_one :current_phase
  has_and_belongs_to_many :users
end
