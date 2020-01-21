require_relative 'use_case'
require_relative '../domain/factory/recipe_factory'
require_relative '../common/const'

# レシピのカロリーを計算するユースケース
class CalculateCalorieUseCase
  include UseCase

  @recipe_factory = nil

  # recipe_repository: レシピリポジトリ
  def initialize(recipe_factory)
    @recipe_factory = recipe_factory
  end

  def execute(input)
    if input.type != CALCULATE_CALORIE_INPUT
      raise NotImplementedError.new("#{self.class}##{__method__}の引数の型が間違っています。")
    end

    recipe_entity = @recipe_factory.create_recipe
    CalculateCalorieOutput.new(recipe_entity.get_calorie)
  end

end