require_relative '../../domain/entity/nutrition_entity'
require_relative '../../domain/value_object/nutrition'
require_relative '../../domain/entity/material_entity'
require_relative '../../domain/value_object/material_id'
require_relative '../../domain/entity/remark_entity'
require_relative '../../domain/value_object/unit'
require_relative '../../domain/repository/recipe_repository'
require_relative '../../domain/entity/recipe_entity'
require_relative '../../domain/value_object/recipe_id'

# レシピを取得するRepositoryの実態
class RecipeRepositoryImpl
  include RecipeRepository

  # <editor-fold desc="外部に後悔するメソッド">

  # レシピエンティティを取得する
  def get_recipe
    materials = [get_moyashi, get_toumyou, get_butabara, get_shio_koshou, get_shouyu, get_torigara_soup, get_shiroiri_goma, get_rayu]
    material_amounts = [get_moyashi_amount, get_toumyou_amount, get_butabara_amount, get_shio_koshou_amount, get_shouyu_amount,
                        get_torigara_soup_amount, get_shiroiri_goma_amount, get_rayu_amount]

    RecipeEntity.new(1, "豆苗の豚巻き", materials, material_amounts)
  end

  # </editor-fold>

  # <editor-fold desc="プライベートメソッド群">

  private

  # <editor-fold desc="材料の情報を取得するメソッド">
  def get_material(material_id, material_name, nutritions, remarks = nil)
    MaterialEntity.new(MaterialID.new(material_id), material_name, nutritions, remarks)
  end

  def get_nutrition(nutrition_name, amount)
    NutritionEntity.new(nutrition_name, amount)
  end

  def get_remark(unit_name, gram)
    RemarkEntity.new(unit_name, gram)
  end

  # </editor-fold>

  # <editor-fold desc="材料の使用量を取得するメソッド">

  def get_materia_amount(material_id, unit_name, amount)
    AmountEntity.new(MaterialID.new(material_id), unit_name, amount)
  end

  # </editor-fold>

  # <editor-fold desc="材料の情報を取得するメソッド(材料ごとに特化した形式)">
  def get_moyashi
    nutritions = [get_nutrition(Nutrition::CALORIE, 14.0), get_nutrition(Nutrition::SHOKUEN, 0.0)]
    get_material(1, "もやし", nutritions)
  end

  def get_toumyou
    remark = get_remark(Unit::PACK, 100.0)
    nutritions = [get_nutrition(Nutrition::CALORIE, 27.0), get_nutrition(Nutrition::SHOKUEN, 0.0)]
    get_material(2, "豆苗", nutritions, remark)
  end

  def get_butabara
    nutritions = [get_nutrition(Nutrition::CALORIE, 395.0), get_nutrition(Nutrition::SHOKUEN, 0.1)]
    get_material(3, "豚バラ肉", nutritions)
  end

  def get_shio_koshou
    remark = get_remark(Unit::SHOUSHOU, 0.5)
    nutritions = [get_nutrition(Nutrition::CALORIE, 116.0), get_nutrition(Nutrition::SHOKUEN, 66.0)]
    get_material(4, "塩こしょう", nutritions)
  end

  def get_shouyu
    remark = get_remark(Unit::OOSAJI, 18.0)
    nutritions = [get_nutrition(Nutrition::CALORIE, 71.0), get_nutrition(Nutrition::SHOKUEN, 14.5)]
    get_material(5, "しょうゆ", nutritions)
  end

  def get_torigara_soup
    remark = get_remark(Unit::KOSAJI, 2.0)
    nutritions = [get_nutrition(Nutrition::CALORIE, 211.0), get_nutrition(Nutrition::SHOKUEN, 47.5)]
    get_material(6, "鶏ガラスープの素", nutritions)
  end

  def get_shiroiri_goma
    remark = get_remark(Unit::OOSAJI, 9.0)
    nutritions = [get_nutrition(Nutrition::CALORIE, 599.0), get_nutrition(Nutrition::SHOKUEN, 0.0)]
    get_material(7, "白いりごま", nutritions)
  end

  def get_rayu
    remark = get_remark(Unit::KOSAJI, 4.0)
    nutritions = [get_nutrition(Nutrition::CALORIE, 919.0), get_nutrition(Nutrition::SHOKUEN, 0.0)]
    get_material(8, "ラー油", nutritions)
  end

  # </editor-fold>

  # <editor-fold desc="材料の使用量を取得するメソッド(材料ごとに特化した形式)">
  def get_moyashi_amount
    get_materia_amount(1, Unit::GRAM, 100)
  end

  def get_toumyou_amount
    get_materia_amount(2, Unit::PACK, 1)
  end

  def get_butabara_amount
    get_materia_amount(3, Unit::GRAM, 150)
  end

  def get_shio_koshou_amount
    get_materia_amount(4, Unit::SHOUSHOU, 1)
  end

  def get_shouyu_amount
    get_materia_amount(5, Unit::OOSAJI, 1)
  end

  def get_torigara_soup_amount
    get_materia_amount(6, Unit::KOSAJI, 0.5)
  end

  def get_shiroiri_goma_amount
    get_materia_amount(7, Unit::OOSAJI, 1)
  end

  def get_rayu_amount
    get_materia_amount(8, Unit::KOSAJI, 0.5)
  end

  # </editor-fold>
  # </editor-fold>
end