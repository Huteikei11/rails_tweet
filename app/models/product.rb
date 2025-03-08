class Product < ApplicationRecord
  validates :name, :content, presence: true
end
