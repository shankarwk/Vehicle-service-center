# frozen_string_literal: true

class ServiceCenter < ApplicationRecord
  belongs_to :user
  has_many :service_types, dependent: :destroy
  has_many :slots, dependent: :destroy
  has_many :clients, dependent: :destroy
  has_one_attached :image 
  

  validates :shop_owner, presence: true
  validates :shop_name, presence: true
  validates :location , presence:true
  validates :address , presence:true
end
