require_relative 'entity'

# 備考情報Entity
class RemarkEntity
  include Entity

  @unit = nil
  @gram = nil

  # unit: 単位
  # gram: グラム数
  def initialize(unit, gram)
    @unit = unit
    @gram = gram
  end

end