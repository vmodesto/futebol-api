class CurrentPhase < ApplicationRecord
  belongs_to :championship, dependent: :destroy
end
