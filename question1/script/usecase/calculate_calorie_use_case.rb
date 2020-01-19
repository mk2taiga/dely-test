require_relative '../script/common/const'
require_relative 'usecase/use_case'

# レシピのカロリーを計算するユースケース
class CalculateCalorieUseCase
  include UseCase

  def execute(input)
    if input.type != CALCULATE_CALORIE_INPUT
      raise NotImplementedError.new("#{self.class}##{__method__}の引数の型が間違っています。")
    end

    # TODO レシピEntityを取得する
    # TODO カロリーを計算する
    CalculateCalorieOutput.new("800")
  end

end