require_relative 'entity'

# レシピEntity
class Recipe
  include Entity

  @recipe_id = nil
  @recipe_name = nil
  @materials = []

  # recipe_id: レシピを一意に識別するID
  # recipe_name: レシピ名
  # materials: 材料の配列
  def initialize(recipe_id, recipe_name, materials)
    @recipe_id = recipe_id
    @recipe_name = recipe_name
    @materials = materials
  end

  # レシピのカロリーを返却する
  def get_calorie
    recipe_calorie = 0

    @materials.map do |material|
      recipe_calorie += material.get_calorie
    end

    recipe_calorie
  end

end