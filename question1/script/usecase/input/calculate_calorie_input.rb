require_relative '../../common/const'

# カロリー計算ユースケースのインプットパラメータ
class CalculateCalorieInput
  include InputPort

  def type
    CALCULATE_CALORIE_INPUT
  end

end