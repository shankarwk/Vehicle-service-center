class Slot < ApplicationRecord
    scope :available, -> { where(:status => 'available')}
    scope :available?, -> { where(:status => 'available')}

    # Ex:- scope :active, -> {where(:active => true)}
end
