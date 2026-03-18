class Customer < ApplicationRecord
  validates :full_name, presence: true
end
