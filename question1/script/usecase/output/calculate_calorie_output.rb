# カロリー計算ユースケースのアウトプットパラメータ
class CalculateCalorieOutput
  include OutputPort

  # カロリー
  @calorie = nil

  # calorie: カロリー
  def initialize(calorie)
    @calorie = calorie
  end

  def result
    @calorie
  end

end