require_relative '../script/common/const'

# レシピのカロリーを計算するユースケース
class CalculateCalorieUseCase
  include UseCase

  def execute(input)
    if input.type == CALCULATE_CALORIE_INPUT
      # TODO レシピEntityを取得する
      # TODO カロリーを計算する
      # TODO カロリーをOutPutに格納する
      # TODO OutPutを返却する
    end
  end

end