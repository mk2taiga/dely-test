require_relative 'value_object'

# 栄養素のValueObject
module Nutrition
  include ValueObject

  CALORIE = "カロリー"
  SHOKUEN = "食塩相当量"
end