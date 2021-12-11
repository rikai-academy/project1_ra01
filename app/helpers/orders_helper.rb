module OrdersHelper
  def order_count_over_one
    if @order.order_items.count > 0
      return "#{@order.order_items.count}"
    end
  end

  def order_has_items
    return @order.order_items.count > 0
  end

  def total_order_items
    total = @order.order_items.map(&:quantily).sum
    return total if total > 0
  end

end
