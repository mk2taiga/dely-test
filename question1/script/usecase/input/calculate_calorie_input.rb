require_relative '../../common/const'
require_relative 'input_port'

# カロリー計算ユースケースのインプットパラメータ
class CalculateCalorieInput
  include InputPort

  def type
    CALCULATE_CALORIE_INPUT
  end

end