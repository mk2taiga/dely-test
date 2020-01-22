require_relative 'entity'

# 栄養Entity
class NutritionEntity
  include Entity

  @nutrition_name = nil
  @amount = nil

  def equal?(other)
    other.nutrition_name == @nutrition_name
  end

  # nutrition_name: 栄養名
  # amount: 栄養量
  def initialize(nutrition_name, amount)
    @nutrition_name = nutrition_name
    @amount = amount
  end

  def get_nutrition_name
    @nutrition_name
  end

  # カロリーを取得する
  def get_nutrition_amount(gram)
    # 栄養価が100gramあたりという仕様であるため
    @amount * gram / 100
  end

end