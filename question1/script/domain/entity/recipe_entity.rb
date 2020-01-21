require_relative 'entity'

# レシピEntity
class RecipeEntity
  include Entity

  @recipe_id = nil
  @recipe_name = nil
  @material_entities = []
  @amount_entities = []

  # recipe_id: レシピを一意に識別するID
  # recipe_name: レシピ名
  # material_entities: 材料の配列
  # amount_entities: 材料の使用量の配列
  def initialize(recipe_id, recipe_name, material_entities, amount_entities)
    @recipe_id = recipe_id
    @recipe_name = recipe_name
    @material_entities = material_entities
    @amount_entities = amount_entities
  end

  # レシピのカロリーを返却する
  def get_calorie
    recipe_calorie = 0

    @material_entities.map do |material|
      @amount_entities.map do |amount|
        recipe_calorie += material.get_calorie(amount) if amount.equal?(material.get_material_id)
      end
    end

    recipe_calorie
  end

  private

end