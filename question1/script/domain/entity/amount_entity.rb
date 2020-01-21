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


  def equal?(other)
    other == @material_id
  end

  def get_material_id
    @material_id
  end

  def get_unit
    @unit
  end

  def get_amount
    @amount
  end

  # 使用量を算出する
  # @param[AmountSpecEntity]
  def calculate_amount(spec)
    # specがnilなら、特別な仕様がないためそのまま返却する
    return @amount if spec.nil?

    # specの単位と、使用量の単位が違ったら計算ができないためエラーを出力する
    raise ArgumentError("使用量と仕様の単位が違います") if @unit != spec.get_unit

    # 仕様のグラム数に、使用量を掛けて、本来の使用するグラム数を計算する
    spec.get_gram * @amount
  end
end