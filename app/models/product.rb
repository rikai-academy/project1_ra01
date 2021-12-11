class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  belongs_to :user
  belongs_to :product_category

  private
  def not_referenced_by_any_order_item
    unless order_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
end
