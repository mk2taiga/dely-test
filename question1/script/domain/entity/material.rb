require_relative 'entity'

# 材料Entity
class Material
  include Entity

  @material_id = nil
  @material_name = nil
  @nutritions = []
  @amount_spec = nil

  # material_id: 材料を一意にに識別するID
  # material_name: 材料名
  # nutrition_entities: 栄養素
  # amount_spec_entity: 備考情報
  def initialize(material_id, material_name, nutrition_entities, amount_spec_entity = nil)
    @material_id = material_id
    @material_name = material_name
    @nutritions = nutrition_entities
    @amount_spec = amount_spec_entity
  end

  # 最良IDを取得する
  def get_material_id
    @material_id
  end

  # 材料名を取得する
  def get_material_name
    @material_name
  end

  def get_amount_spec
    @amount_spec
  end

  # amount_entity: 使用量Entity
  def get_calorie(gram)
    @nutritions.map do |e|
      # カロリー数を計算する
      return e.get_nutrition_amount(gram) if e.get_nutrition_name == NutritionType::CALORIE
    end
  end

  # 使用量を生成する
  # amount: 使用量
  def crate_amount(amount)
    if @amount_spec.nil?
      return Amount.new(@material_id, amount)
    end

    Amount.new(@material_id, amount, @amount_spec.get_unit)
  end
end