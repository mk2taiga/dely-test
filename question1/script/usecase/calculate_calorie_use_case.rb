require_relative 'use_case'
require_relative '../domain/repository/recipe_repository'
require_relative '../common/const'

# レシピのカロリーを計算するユースケース
class CalculateCalorieUseCase
  include UseCase

  @recipe_repository = nil

  # recipe_repository: レシピリポジトリ
  def initialize(recipe_repository)
    @recipe_repository = recipe_repository
  end

  def execute(input)
    if input.type != CALCULATE_CALORIE_INPUT
      raise NotImplementedError.new("#{self.class}##{__method__}の引数の型が間違っています。")
    end

    # TODO カロリーを計算する

    recipe_entity = @recipe_repository.get_recipe
    CalculateCalorieOutput.new("800")
  end

end