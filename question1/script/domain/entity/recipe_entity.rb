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

    # TODO 材料を取得する
    # TODO 材料IDと一致する使用量を取得する
    # TODO 材料に使用量を渡す
    # TODO 材料からカロリーを取得する
    self.material_entities.each do |material|
      material
    end

    800
  end

end