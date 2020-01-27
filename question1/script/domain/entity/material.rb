require_relative 'entity'

# 材料Entity
class Material
  include Entity

  @material_id = nil
  @food = nil
  @amount = nil

  # material_id: 材料を一意にに識別するID
  # food: 食材
  # amount: 使用量
  def initialize(material_id, food, amount)
    @material_id = material_id
    @food = food
    @amount = amount
  end

  # カロリーを計算する
  def get_calorie
    amount = @amount.calculate_amount(@food.get_spec)
    @food.get_calorie(amount)
  end
end