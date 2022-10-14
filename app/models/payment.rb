class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :service_center
end
