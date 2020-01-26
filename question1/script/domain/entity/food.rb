require_relative 'entity'

class Food
  include Entity

  @food_id = nil
  @food_name = nil
  @nutritions = []
  @amount_spec = nil

  # food_id: 材料を一意にに識別するID
  # food_name: 材料名
  # nutrition_entities: 栄養素
  # amount_spec_entity: 備考情報
  def initialize(food_id, food_name, nutrition_entities, amount_spec_entity = nil)
    @food_id = food_id
    @food_name = food_name
    @nutritions = nutrition_entities
    @amount_spec = amount_spec_entity
  end

  def get_spec
    @amount_spec
  end

  # gram: 使用量グラム
  def get_calorie(gram)
    @nutritions.map do |e|
      # カロリー数を計算する
      return e.get_nutrition_amount(gram) if e.get_nutrition_name == NutritionType::CALORIE
    end
  end

  # 使用量を生成する
  # amount: 使用量
  def crate_amount(amount)
    if @amount_spec.nil?
      return Amount.new(amount)
    end

    Amount.new(amount, @amount_spec.get_unit)
  end
end