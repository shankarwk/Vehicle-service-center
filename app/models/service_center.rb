# frozen_string_literal: true

class ServiceCenter < ApplicationRecord
  belongs_to :user
  has_many :service_types, dependent: :destroy
end
