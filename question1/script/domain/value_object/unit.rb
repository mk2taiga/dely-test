require_relative 'value_object'

# 使用単位のValueObject
class Unit
  include ValueObject
  
  @unit_name = nil

  # unit_name: 使用単位を識別する名前
  def initialize(unit_name)
    @unit_name = unit_name
  end

end