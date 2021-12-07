class Product < ApplicationRecord
  belongs_to :user
  belongs_to :product_category
end
