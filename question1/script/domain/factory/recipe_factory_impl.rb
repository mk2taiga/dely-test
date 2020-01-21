require_relative '../../domain/entity/entity'
require_relative '../../domain/value_object/nutrition'
require_relative '../../domain/entity/material_entity'
require_relative '../../domain/value_object/material_id'
require_relative '../../domain/entity/remark_entity'
require_relative '../../domain/value_object/unit'
require_relative '../../domain/factory/recipe_factory'
require_relative '../../domain/entity/recipe_entity'
require_relative '../../domain/value_object/recipe_id'
require_relative '../../domain/entity/amount_entity'
require_relative '../../domain/entity/nutrition_entity'

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

    materials = [moyashi, toumyou, butabara, shio_koshou, shouyu, torigara_soup, shiroiri_goma, rayu]
    material_amounts = [moyashi.crate_amount(100), toumyou.crate_amount(1), butabara.crate_amount(150),
                        shio_koshou.crate_amount(1), shouyu.crate_amount(1), torigara_soup.crate_amount(0.5),
                        shiroiri_goma.crate_amount(1), rayu.get_calorie(0.5)]

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
  # </editor-fold>
end