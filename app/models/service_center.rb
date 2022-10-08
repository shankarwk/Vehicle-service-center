# frozen_string_literal: true

class ServiceCenter < ApplicationRecord
  belongs_to :user
  has_many :service_types, dependent: :destroy
  has_many :slots, dependent: :destroy
  has_many :clients, dependent: :destroy
end
  