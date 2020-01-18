require_relative 'output_port'

# カロリー計算ユースケースのアウトプットパラメータ
class CalculateCalorieOutput
  include OutputPort

  # カロリー
  @calorie = nil

  # calorie: カロリー
  def initialize(calorie)
    @calorie = calorie
  end

  def output
    @calorie
  end

end