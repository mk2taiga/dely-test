require_relative '../../domain/entity/entity'
require_relative '../../domain/value_object/nutrition_type'
require_relative '../../domain/entity/material'
require_relative '../../domain/value_object/material_id'
require_relative '../../domain/value_object/amount_specification'
require_relative '../../domain/value_object/unit'
require_relative '../../domain/factory/recipe_factory'
require_relative '../../domain/entity/recipe'
require_relative '../../domain/value_object/recipe_id'
require_relative '../../domain/value_object/amount'
require_relative '../../domain/entity/nutrition'
require_relative '../../domain/entity/food'
require_relative '../../domain/value_object/food_id'

# レシピを取得するFactoryの実態
class RecipeFactoryImpl
  include RecipeFactory

  # <editor-fold desc="外部に後悔するメソッド">

  # レシピエンティティを取得する
  def create_recipe
    moyashi = get_moyashi
    toumyou = get_toumyou
    butabara = get_butabara
    shio_koshou = get_shio_koshou
    shouyu = get_shouyu
    torigara_soup = get_torigara_soup
    shiroiri_goma = get_shiroiri_goma
    rayu = get_rayu

    materials = [get_material(1, moyashi, moyashi.crate_amount(100)),
                 get_material(2, toumyou, toumyou.crate_amount(1)),
                 get_material(3, butabara, butabara.crate_amount(150)),
                 get_material(4, shio_koshou, shio_koshou.crate_amount(1)),
                 get_material(5, shouyu, shouyu.crate_amount(1)),
                 get_material(6, torigara_soup, torigara_soup.crate_amount(0.5)),
                 get_material(7, shiroiri_goma, shiroiri_goma.crate_amount(1)),
                 get_material(8, rayu, rayu.crate_amount(0.5))]

    Recipe.new(1, "豆苗の豚巻き", materials)
  end

  # </editor-fold>

  # <editor-fold desc="プライベートメソッド群">

  private

  # <editor-fold desc="食材の情報を取得するメソッド">
  def get_material(material_id, food, amount)
    Material.new(MaterialID.new(material_id), food, amount)
  end

  # </editor-fold>

  # <editor-fold desc="食材の情報を取得するメソッド">
  def get_food(food_id, food_name, nutritions, amount_specs = nil)
    Food.new(FoodID.new(food_id), food_name, nutritions, amount_specs)
  end

  def get_nutrition(nutrition_name, amount)
    Nutrition.new(nutrition_name, amount)
  end

  def get_amount_spec(unit_name, gram)
    AmountSpecification.new(unit_name, gram)
  end

  # </editor-fold>

  # <editor-fold desc="材料の情報を取得するメソッド(材料ごとに特化した形式)">
  def get_moyashi
    nutritions = [get_nutrition(NutritionType::CALORIE, 14.0), get_nutrition(NutritionType::SHOKUEN, 0.0)]
    get_food(1, "もやし", nutritions)
  end

  def get_toumyou
    amount_spec = get_amount_spec(Unit::PACK, 100.0)
    nutritions = [get_nutrition(NutritionType::CALORIE, 27.0), get_nutrition(NutritionType::SHOKUEN, 0.0)]
    get_food(2, "豆苗", nutritions, amount_spec)
  end

  def get_butabara
    nutritions = [get_nutrition(NutritionType::CALORIE, 395.0), get_nutrition(NutritionType::SHOKUEN, 0.1)]
    get_food(3, "豚バラ肉", nutritions)
  end

  def get_shio_koshou
    amount_spec = get_amount_spec(Unit::SHOUSHOU, 0.5)
    nutritions = [get_nutrition(NutritionType::CALORIE, 116.0), get_nutrition(NutritionType::SHOKUEN, 66.0)]
    get_food(4, "塩こしょう", nutritions, amount_spec)
  end

  def get_shouyu
    amount_spec = get_amount_spec(Unit::OOSAJI, 18.0)
    nutritions = [get_nutrition(NutritionType::CALORIE, 71.0), get_nutrition(NutritionType::SHOKUEN, 14.5)]
    get_food(5, "しょうゆ", nutritions, amount_spec)
  end

  def get_torigara_soup
    amount_spec = get_amount_spec(Unit::KOSAJI, 2.0)
    nutritions = [get_nutrition(NutritionType::CALORIE, 211.0), get_nutrition(NutritionType::SHOKUEN, 47.5)]
    get_food(6, "鶏ガラスープの素", nutritions, amount_spec)
  end

  def get_shiroiri_goma
    amount_spec = get_amount_spec(Unit::OOSAJI, 9.0)
    nutritions = [get_nutrition(NutritionType::CALORIE, 599.0), get_nutrition(NutritionType::SHOKUEN, 0.0)]
    get_food(7, "白いりごま", nutritions, amount_spec)
  end

  def get_rayu
    amount_spec = get_amount_spec(Unit::KOSAJI, 4.0)
    nutritions = [get_nutrition(NutritionType::CALORIE, 919.0), get_nutrition(NutritionType::SHOKUEN, 0.0)]
    get_food(8, "ラー油", nutritions, amount_spec)
  end

  # </editor-fold>
  # </editor-fold>
end