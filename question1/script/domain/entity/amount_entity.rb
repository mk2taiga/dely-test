require_relative 'entity'

# 使用量情報Entity
class AmountEntity
  include Entity

  @material_id = nil
  @unit = nil
  @amount = nil

  # 材料を一意に識別するID
  # 材料の使用単位情報
  # 使用量
  def initialize(material_id, unit, amount)
    @material_id = material_id
    @unit = unit
    @amount = amount
  end
end