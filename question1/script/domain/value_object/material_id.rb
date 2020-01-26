require_relative 'value_object'

# 材料を識別するIDのValueObject
class MaterialID
  include ValueObject

  @material_id = nil

  # material_id: 材料のID
  def initialize(material_id)
    @material_id = material_id
  end

end