class CurrentIssue < ApplicationRecord
  belongs_to :championship, dependent: :destroy
end
