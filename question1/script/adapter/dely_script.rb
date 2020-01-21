require_relative '../usecase/input/calculate_calorie_input'
require_relative '../usecase/calculate_calorie_use_case'
require_relative '../usecase/output/calculate_calorie_output'
require_relative '../domain/factory/recipe_factory_impl'
require_relative '../common/const'

# スクリプトをルーティングするモジュール
module Route
  CALCULATE_CALORIE = "calculate_calorie"
end

# スクリプトの引数取得
# 引数は実行したいスクリプト名を期待する
function = ARGV[0]
# エラー文言
err = nil
# 結果
result = nil

# ファンクションと一致するユースケースを実行する
# ファンクションがない場合は、エラーを返却する
case function
when Route::CALCULATE_CALORIE then
  # 計算処理を実行する
  factory = RecipeFactoryImpl.new
  input = CalculateCalorieInput.new
  result = CalculateCalorieUseCase.new(factory).execute(input)

else
  err = "指定されたfunctionは存在しません。引数の最初には、実行したいスクリプト名を指定してください"
end

if result == nil
  err = "何らかの理由で結果が出力されませんでした。"
end

if err != nil
  exit CODE_ERROR
end

# ユースケースから返却された値を出力する
puts result.output