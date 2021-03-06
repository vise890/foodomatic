class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :product

  def name
    self.product.name
  end

  def amount_type
    self.product.amount_type
  end

  def amount_to_buy
    self.required_amount.to_f / self.product.min_amount
  end

  def cost
    self.amount_to_buy * self.product.price
  end
end
