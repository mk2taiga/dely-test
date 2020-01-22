require_relative 'entity'

# レシピEntity
class Recipe
  include Entity

  @recipe_id = nil
  @recipe_name = nil
  @materials = []
  @amounts = []

  # recipe_id: レシピを一意に識別するID
  # recipe_name: レシピ名
  # materials: 材料の配列
  # amounts: 材料の使用量の配列
  def initialize(recipe_id, recipe_name, materials, amounts)
    @recipe_id = recipe_id
    @recipe_name = recipe_name
    @materials = materials
    @amounts = amounts
  end

  # レシピのカロリーを返却する
  def get_calorie
    recipe_calorie = 0

    @materials.map do |material|
      @amounts.map do |amount|
        if amount.get_material_id == material.get_material_id
          gram = amount.calculate_amount(material.get_amount_spec)
          recipe_calorie += material.get_calorie(gram)
        end
      end
    end

    recipe_calorie
  end

end