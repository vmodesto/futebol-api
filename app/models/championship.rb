class Championship < ApplicationRecord
  has_one :current_issue
  has_one :current_phase
end
