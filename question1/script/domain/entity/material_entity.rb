require_relative 'entity'

# 材料Entity
class MaterialEntity
  include Entity

  @material_id = nil
  @material_name = nil
  @nutrition_entities = []
  @remark_entity = nil

  # material_id: 材料を一意にに識別するID
  # material_name: 材料名
  # nutrition_entities: 栄養素
  # remark_entity: 備考情報
  def initialize(material_id, material_name, nutrition_entities, remark_entity = nil)
    @material_id = material_id
    @material_name = material_name
    @nutrition_entities = nutrition_entities
    @remark_entity = remark_entity
  end

  # amount: 使用量
  def get_calorie(amount)
    # TODO 材料のカロリーを返却する処理を実装
  end

  # 使用量を生成する
  def crate_amount
    AmountEntity.new(@material_id, unit_name, amount)
  end
end