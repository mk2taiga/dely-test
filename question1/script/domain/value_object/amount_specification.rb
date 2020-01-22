require_relative '../entity/entity'

# 備考情報Entity
class AmountSpecification
  include ValueObject

  @unit = nil
  @gram = nil

  def equal?(other)
    other.unit == @unit && other.gram == @gram
  end


  # unit: 使用単位
  # gram: グラム数
  def initialize(unit, gram)
    @unit = unit
    @gram = gram
  end

  # 使用単位を返却する
  def get_unit
    @unit
  end

  # グラム数を返却する
  def get_gram
    @gram
  end

end