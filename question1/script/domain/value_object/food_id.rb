require_relative 'value_object'

# 食材を識別するIDのValueObject
class FoodID
  include ValueObject

  @food_id = nil

  # food_id: 食材のID
  def initialize(food_id)
    @food_id = food_id
  end
end