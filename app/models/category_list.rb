class CategoryList < ApplicationRecord
    scope :cat, -> { where(:status => 'available')}
end
