require_relative 'value_object'

# 使用量情報Entity
class Amount
  include ValueObject

  @unit = nil
  @amount = nil

  # 材料の使用単位情報
  # 使用量
  def initialize(amount, unit = Unit::GRAM)
    @amount = amount
    @unit = unit
  end

  def equal?(other)
    other.food_id == @food_id && other.unit == @unit
  end

  # 使用量を算出する
  # @param[AmountSpecification]
  def calculate_amount(spec)
    # specがnilなら、特別な仕様がないためそのまま返却する
    return @amount if spec.nil?

    # specの単位と、使用量の単位が違ったら計算ができないためエラーを出力する
    raise ArgumentError("使用量と仕様の単位が違います") if @unit != spec.get_unit

    # 仕様のグラム数に、使用量を掛けて、本来の使用するグラム数を計算する
    spec.get_gram * @amount
  end
end