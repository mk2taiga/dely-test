require_relative 'entity'

# 材料Entity
class MaterialEntity
  include Entity

  @material_id = nil
  @material_name = nil
  @nutrition_entities = []
  @amount_spec_entity = nil

  # material_id: 材料を一意にに識別するID
  # material_name: 材料名
  # nutrition_entities: 栄養素
  # amount_spec_entity: 備考情報
  def initialize(material_id, material_name, nutrition_entities, amount_spec_entity = nil)
    @material_id = material_id
    @material_name = material_name
    @nutrition_entities = nutrition_entities
    @amount_spec_entity = amount_spec_entity
  end

  # 最良IDを取得する
  def get_material_id
    @material_id
  end

  # 材料名を取得する
  def get_material_name
    @material_name
  end

  # amount_entity: 使用量Entity
  def get_calorie(amount_entity)
    # TODO 材料のカロリーを返却する処理を実装
    200
  end

  # 使用量を生成する
  # amount: 使用量
  def crate_amount(amount)
    if @amount_spec_entity.nil?
      return AmountEntity.new(@material_id, Unit::GRAM, amount)
    end

    AmountEntity.new(@material_id, @amount_spec_entity.get_unit, amount)
  end
end