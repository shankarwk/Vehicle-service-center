# frozen_string_literal: true

class User < ApplicationRecord
  has_many :service_centers, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def change_user_to_paid
    update(membership: 1)
  end       
end
