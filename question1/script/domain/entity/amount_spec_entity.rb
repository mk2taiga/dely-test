require_relative 'entity'

# 備考情報Entity
class AmountSpecEntity
  include Entity

  @unit = nil
  @gram = nil

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